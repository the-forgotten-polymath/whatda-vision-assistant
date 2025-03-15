//
//  SubjectAnalyzer.swift
//  WhatDa
//

import CoreGraphics
import Foundation
import Vision

public protocol SubjectAnalyzing: Sendable {
    func analyze(cgImage: CGImage) async throws -> [VisualObservation]
}

public final class SubjectAnalyzer: SubjectAnalyzing, Sendable {
    public init() {}

    public func analyze(cgImage: CGImage) async throws -> [VisualObservation] {
        try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global(qos: .userInitiated).async {
                let request = VNClassifyImageRequest { request, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                        return
                    }

                    guard let observations = request.results as? [VNClassificationObservation] else {
                        continuation.resume(returning: [])
                        return
                    }

                    // Filter top classification candidates (Vision taxonomies spread confidence across many classes)
                    let topObservations = observations
                        .filter { $0.confidence > 0.03 }
                        .sorted(by: { $0.confidence > $1.confidence })
                        .prefix(8)
                        .map { observation in
                            VisualObservation(
                                label: observation.identifier.replacingOccurrences(of: "_", with: " "),
                                confidence: observation.confidence
                            )
                        }

                    continuation.resume(returning: Array(topObservations))
                }

                let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
                do {
                    try handler.perform([request])
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
