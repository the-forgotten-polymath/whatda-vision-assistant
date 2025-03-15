//
//  VisualContext.swift
//  WhatDa
//

import CoreGraphics
import Foundation

public struct RecognizedTextItem: Sendable, Equatable, Codable, Identifiable {
    public let id: UUID
    public let text: String
    public let confidence: Float
    public let boundingBox: CGRect?

    public init(id: UUID = UUID(), text: String, confidence: Float, boundingBox: CGRect? = nil) {
        self.id = id
        self.text = text
        self.confidence = confidence
        self.boundingBox = boundingBox
    }
}

public struct BarcodeItem: Sendable, Equatable, Codable, Identifiable {
    public let id: UUID
    public let payload: String
    public let symbology: String

    public init(id: UUID = UUID(), payload: String, symbology: String) {
        self.id = id
        self.payload = payload
        self.symbology = symbology
    }
}

public struct ImageQuality: Sendable, Equatable, Codable {
    public let isBlurry: Bool
    public let isDark: Bool
    public let brightness: Float
    public let sharpness: Float

    public init(isBlurry: Bool = false, isDark: Bool = false, brightness: Float = 0.5, sharpness: Float = 1.0) {
        self.isBlurry = isBlurry
        self.isDark = isDark
        self.brightness = brightness
        self.sharpness = sharpness
    }

    public var isAcceptable: Bool {
        !isBlurry && !isDark
    }
}

public struct VisualContext: Sendable, Equatable {
    public let recognizedText: [RecognizedTextItem]
    public let barcodes: [BarcodeItem]
    public let observations: [VisualObservation]
    public let imageQuality: ImageQuality

    nonisolated public init(
        recognizedText: [RecognizedTextItem] = [],
        barcodes: [BarcodeItem] = [],
        observations: [VisualObservation] = [],
        imageQuality: ImageQuality = ImageQuality()
    ) {
        self.recognizedText = recognizedText
        self.barcodes = barcodes
        self.observations = observations
        self.imageQuality = imageQuality
    }
}
