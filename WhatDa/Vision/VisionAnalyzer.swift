//
//  VisionAnalyzer.swift
//  WhatDa
//

import Foundation

public protocol VisionAnalyzer: Sendable {
    func analyze(_ image: CapturedImage) async throws -> VisualContext
}

public enum VisionError: LocalizedError, Sendable {
    case invalidImage
    case analysisFailed(String)
    case cancelled

    public var errorDescription: String? {
        switch self {
        case .invalidImage:
            return "The image could not be processed by Vision."
        case .analysisFailed(let detail):
            return "Vision analysis failed: \(detail)"
        case .cancelled:
            return "Vision analysis was cancelled."
        }
    }
}
