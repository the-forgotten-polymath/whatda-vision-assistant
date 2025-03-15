//
//  ScanRepository.swift
//  WhatDa
//

import SwiftData
import UIKit

@MainActor
public protocol ScanRepository: AnyObject {
    func saveScan(result: ExplanationResult, image: UIImage) async throws -> Scan
    func fetchAllScans() throws -> [Scan]
    func fetchScan(id: UUID) throws -> Scan?
    func addMessage(scanId: UUID, message: ChatMessage) throws
    func deleteScan(id: UUID) async throws
}

@MainActor
public final class DefaultScanRepository: ScanRepository {
    private let modelContext: ModelContext
    private let imageStore: ImageStoring

    public init(modelContext: ModelContext, imageStore: ImageStoring = ImageStore.shared) {
        self.modelContext = modelContext
        self.imageStore = imageStore
    }

    public func saveScan(result: ExplanationResult, image: UIImage) async throws -> Scan {
        // 1. Save image file to disk first
        let imagePath = try await imageStore.saveImage(image, id: result.id)

        // 2. Insert into SwiftData
        let scan = Scan(
            id: result.id,
            createdAt: Date(),
            subject: result.subject,
            definition: result.definition,
            simpleExplanation: result.simpleExplanation,
            analogy: result.analogy,
            funFact: result.funFact,
            categoryRawValue: result.category.rawValue,
            confidenceRawValue: result.confidence.rawValue,
            imagePath: imagePath,
            followUpQuestions: result.followUpQuestions,
            messages: []
        )

        modelContext.insert(scan)
        try modelContext.save()
        return scan
    }

    public func fetchAllScans() throws -> [Scan] {
        let descriptor = FetchDescriptor<Scan>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
        return try modelContext.fetch(descriptor)
    }

    public func fetchScan(id: UUID) throws -> Scan? {
        let predicate = #Predicate<Scan> { $0.id == id }
        var descriptor = FetchDescriptor<Scan>(predicate: predicate)
        descriptor.fetchLimit = 1
        return try modelContext.fetch(descriptor).first
    }

    public func addMessage(scanId: UUID, message: ChatMessage) throws {
        guard let scan = try fetchScan(id: scanId) else {
            return
        }
        let storedMessage = StoredMessage(
            id: message.id,
            roleRawValue: message.sender.rawValue,
            content: message.content,
            timestamp: message.timestamp,
            scan: scan
        )
        modelContext.insert(storedMessage)
        try modelContext.save()
    }

    public func deleteScan(id: UUID) async throws {
        guard let scan = try fetchScan(id: id) else { return }
        let imagePath = scan.imagePath

        // 1. Remove from SwiftData
        modelContext.delete(scan)
        try modelContext.save()

        // 2. Remove associated image from disk
        try await imageStore.deleteImage(path: imagePath)
    }
}
