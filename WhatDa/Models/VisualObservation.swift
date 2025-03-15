//
//  VisualObservation.swift
//  WhatDa
//

import CoreGraphics
import Foundation

public struct VisualObservation: Sendable, Equatable, Codable, Identifiable {
    public let id: UUID
    public let label: String
    public let confidence: Float
    public let boundingBox: CGRect?

    public init(id: UUID = UUID(), label: String, confidence: Float, boundingBox: CGRect? = nil) {
        self.id = id
        self.label = label
        self.confidence = confidence
        self.boundingBox = boundingBox
    }
}
