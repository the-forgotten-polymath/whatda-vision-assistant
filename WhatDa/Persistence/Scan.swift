//
//  Scan.swift
//  WhatDa
//

import Foundation
import SwiftData

@Model
public final class Scan {
    @Attribute(.unique)
    public var id: UUID
    public var createdAt: Date
    public var subject: String
    public var definition: String
    public var simpleExplanation: String
    public var analogy: String?
    public var funFact: String?
    public var categoryRawValue: String
    public var confidenceRawValue: String
    public var imagePath: String
    public var followUpQuestions: [String]

    @Relationship(deleteRule: .cascade, inverse: \StoredMessage.scan)
    public var messages: [StoredMessage]

    public init(
        id: UUID = UUID(),
        createdAt: Date = Date(),
        subject: String,
        definition: String,
        simpleExplanation: String,
        analogy: String? = nil,
        funFact: String? = nil,
        categoryRawValue: String = SubjectCategory.unknown.rawValue,
        confidenceRawValue: String = ConfidenceLevel.medium.rawValue,
        imagePath: String,
        followUpQuestions: [String] = [],
        messages: [StoredMessage] = []
    ) {
        self.id = id
        self.createdAt = createdAt
        self.subject = subject
        self.definition = definition
        self.simpleExplanation = simpleExplanation
        self.analogy = analogy
        self.funFact = funFact
        self.categoryRawValue = categoryRawValue
        self.confidenceRawValue = confidenceRawValue
        self.imagePath = imagePath
        self.followUpQuestions = followUpQuestions
        self.messages = messages
    }

    public var category: SubjectCategory {
        SubjectCategory(rawValue: categoryRawValue) ?? .unknown
    }

    public var confidence: ConfidenceLevel {
        ConfidenceLevel(rawValue: confidenceRawValue) ?? .medium
    }

    public var toExplanationResult: ExplanationResult {
        ExplanationResult(
            id: id,
            subject: subject,
            confidence: confidence,
            definition: definition,
            simpleExplanation: simpleExplanation,
            analogy: analogy,
            funFact: funFact,
            observations: [],
            followUpQuestions: followUpQuestions,
            category: category
        )
    }
}
