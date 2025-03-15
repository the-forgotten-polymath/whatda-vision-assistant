//
//  TextAnalyzer.swift
//  WhatDa
//

import CoreGraphics
import Foundation
import Vision

public protocol TextAnalyzing: Sendable {
    func analyze(cgImage: CGImage) async throws -> [RecognizedTextItem]
}

public final class TextAnalyzer: TextAnalyzing, Sendable {
    public init() {}

    public func analyze(cgImage: CGImage) async throws -> [RecognizedTextItem] {
        try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global(qos: .userInitiated).async {
                let request = VNRecognizeTextRequest { request, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                        return
                    }

                    guard let observations = request.results as? [VNRecognizedTextObservation] else {
                        continuation.resume(returning: [])
                        return
                    }

                    // Extract top candidate for each observation and filter tiny or very low confidence fragments
                    let items: [RecognizedTextItem] = observations.compactMap { observation in
                        guard let topCandidate = observation.topCandidates(1).first else { return nil }
                        let text = topCandidate.string.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !text.isEmpty, topCandidate.confidence > 0.3 else { return nil }

                        return RecognizedTextItem(
                            text: text,
                            confidence: topCandidate.confidence,
                            boundingBox: observation.boundingBox
                        )
                    }

                    // Rank by prominence (bounding box height/area) and cap to top 25 relevant lines
                    let sorted = items.sorted { ($0.boundingBox?.height ?? 0) > ($1.boundingBox?.height ?? 0) }
                    continuation.resume(returning: Array(sorted.prefix(25)))
                }

                request.recognitionLevel = .accurate
                request.usesLanguageCorrection = true
                request.minimumTextHeight = 0.02

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
