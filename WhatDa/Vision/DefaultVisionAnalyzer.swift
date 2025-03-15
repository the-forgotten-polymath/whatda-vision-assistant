//
//  DefaultVisionAnalyzer.swift
//  WhatDa
//

import CoreGraphics
import Foundation

public final class DefaultVisionAnalyzer: VisionAnalyzer, Sendable {
    private let textAnalyzer: any TextAnalyzing
    private let barcodeAnalyzer: any BarcodeAnalyzing
    private let qualityAnalyzer: any ImageQualityAnalyzing
    private let subjectAnalyzer: any SubjectAnalyzing

    public init(
        textAnalyzer: any TextAnalyzing = TextAnalyzer(),
        barcodeAnalyzer: any BarcodeAnalyzing = BarcodeAnalyzer(),
        qualityAnalyzer: any ImageQualityAnalyzing = ImageQualityAnalyzer(),
        subjectAnalyzer: any SubjectAnalyzing = SubjectAnalyzer()
    ) {
        self.textAnalyzer = textAnalyzer
        self.barcodeAnalyzer = barcodeAnalyzer
        self.qualityAnalyzer = qualityAnalyzer
        self.subjectAnalyzer = subjectAnalyzer
    }

    public func analyze(_ image: CapturedImage) async throws -> VisualContext {
        guard let cgImage = image.cgImage else {
            throw VisionError.invalidImage
        }

        let text = self.textAnalyzer
        let barcode = self.barcodeAnalyzer
        let quality = self.qualityAnalyzer
        let subject = self.subjectAnalyzer

        return await Task.detached(priority: .userInitiated) {
            async let textTask = text.analyze(cgImage: cgImage)
            async let barcodeTask = barcode.analyze(cgImage: cgImage)
            async let qualityTask = quality.analyze(cgImage: cgImage)
            async let subjectTask = subject.analyze(cgImage: cgImage)

            let recognizedText = (try? await textTask) ?? []
            let barcodes = (try? await barcodeTask) ?? []
            let imageQuality = await qualityTask
            let subjects = (try? await subjectTask) ?? []

            return VisualContext(
                recognizedText: recognizedText,
                barcodes: barcodes,
                observations: subjects,
                imageQuality: imageQuality
            )
        }.value
    }
}
