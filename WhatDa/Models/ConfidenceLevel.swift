//
//  ConfidenceLevel.swift
//  WhatDa
//

import Foundation

public enum ConfidenceLevel: String, Sendable, Codable, CaseIterable {
    case high
    case medium
    case low

    public var displayName: String {
        switch self {
        case .high: return "High Confidence"
        case .medium: return "Probable"
        case .low: return "Uncertain"
        }
    }
}
