//
//  GenerableTypes.swift
//  WhatDa
//
//  Created by Antigravity.
//

#if canImport(FoundationModels)
import FoundationModels

@available(iOS 26.0, *)
@Generable
public struct GeneratedExplanation {
    @Guide(description: "Primary subject name")
    public var subject: String

    public var confidence: GeneratedConfidence
    public var definition: String
    public var simpleExplanation: String
    public var analogy: String?
    public var funFact: String?
    public var observations: [GeneratedObservation]
    public var followUpQuestions: [String]
    public var category: GeneratedCategory
}

@available(iOS 26.0, macOS 15.0, *)
@Generable
public enum GeneratedConfidence: String {
    case high
    case medium
    case low
    
    func toAppConfidence() -> ConfidenceLevel {
        switch self {
        case .high: return .high
        case .medium: return .medium
        case .low: return .low
        }
    }
}

@available(iOS 26.0, macOS 15.0, *)
@Generable
public enum GeneratedCategory: String {
    case object, animal, plant, food, vehicle, technology, architecture, document, diagram, artwork, text, person, unknown
    
    func toAppCategory() -> SubjectCategory {
        return SubjectCategory(rawValue: self.rawValue) ?? .unknown
    }
}

@available(iOS 26.0, macOS 15.0, *)
@Generable
public struct GeneratedObservation {
    public var label: String
    public var confidence: Double
    
}
#endif
