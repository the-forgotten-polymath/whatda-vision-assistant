//
//  CapturedImage.swift
//  WhatDa
//

import UIKit

public struct CapturedImage: Sendable, Identifiable {
    public let id: UUID
    public let uiImage: UIImage
    public let timestamp: Date
    public let source: ImageSource

    public enum ImageSource: String, Sendable, Codable {
        case camera
        case photoLibrary
    }

    public init(id: UUID = UUID(), uiImage: UIImage, timestamp: Date = Date(), source: ImageSource = .camera) {
        self.id = id
        self.uiImage = uiImage
        self.timestamp = timestamp
        self.source = source
    }

    public var cgImage: CGImage? {
        uiImage.cgImage
    }

    public var jpegData: Data? {
        uiImage.jpegData(compressionQuality: 0.85)
    }
}
