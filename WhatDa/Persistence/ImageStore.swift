//
//  ImageStore.swift
//  WhatDa
//

import UIKit

public protocol ImageStoring: Sendable {
    func saveImage(_ image: UIImage, id: UUID) async throws -> String
    func loadImage(path: String) async -> UIImage?
    func deleteImage(path: String) async throws
}

public final class ImageStore: ImageStoring, @unchecked Sendable {
    public static let shared = ImageStore()

    private let fileManager = FileManager.default
    private let cache = NSCache<NSString, UIImage>()
    private let directoryURL: URL

    public init() {
        let appSupport = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        self.directoryURL = appSupport.appendingPathComponent("Scans", isDirectory: true)
        try? fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
        cache.countLimit = 50
    }

    public func saveImage(_ image: UIImage, id: UUID) async throws -> String {
        let filename = "\(id.uuidString).jpg"
        let fileURL = directoryURL.appendingPathComponent(filename)

        guard let data = image.jpegData(compressionQuality: 0.85) else {
            throw ImageStoreError.compressionFailed
        }

        try data.write(to: fileURL, options: .atomic)
        cache.setObject(image, forKey: filename as NSString)
        return filename
    }

    public func loadImage(path: String) async -> UIImage? {
        let filename = (path as NSString).lastPathComponent
        if let cached = cache.object(forKey: filename as NSString) {
            return cached
        }

        let fileURL = directoryURL.appendingPathComponent(filename)
        guard let data = try? Data(contentsOf: fileURL),
              let image = UIImage(data: data) else {
            return nil
        }

        cache.setObject(image, forKey: filename as NSString)
        return image
    }

    public func deleteImage(path: String) async throws {
        let filename = (path as NSString).lastPathComponent
        cache.removeObject(forKey: filename as NSString)
        let fileURL = directoryURL.appendingPathComponent(filename)
        if fileManager.fileExists(atPath: fileURL.path) {
            try fileManager.removeItem(at: fileURL)
        }
    }
}

public enum ImageStoreError: LocalizedError {
    case compressionFailed
    case fileNotFound

    public var errorDescription: String? {
        switch self {
        case .compressionFailed:
            return "Failed to compress image data for storage."
        case .fileNotFound:
            return "Saved image file could not be found."
        }
    }
}
