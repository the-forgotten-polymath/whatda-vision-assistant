//
//  BarcodeAnalyzer.swift
//  WhatDa
//

import CoreGraphics
import Foundation
import Vision

public protocol BarcodeAnalyzing: Sendable {
    func analyze(cgImage: CGImage) async throws -> [BarcodeItem]
}

public final class BarcodeAnalyzer: BarcodeAnalyzing, Sendable {
    public init() {}

    public func analyze(cgImage: CGImage) async throws -> [BarcodeItem] {
        try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global(qos: .userInitiated).async {
                let request = VNDetectBarcodesRequest { request, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                        return
                    }

                    guard let observations = request.results as? [VNBarcodeObservation] else {
                        continuation.resume(returning: [])
                        return
                    }

                    let items: [BarcodeItem] = observations.compactMap { observation in
                        guard let payload = observation.payloadStringValue, !payload.isEmpty else { return nil }
                        return BarcodeItem(
                            payload: payload,
                            symbology: observation.symbology.rawValue
                        )
                    }

                    continuation.resume(returning: items)
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
