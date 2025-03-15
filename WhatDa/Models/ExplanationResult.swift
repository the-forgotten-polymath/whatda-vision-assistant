//
//  ExplanationResult.swift
//  WhatDa
//

import Foundation

public struct ExplanationResult: Sendable, Equatable, Identifiable {
    public let id: UUID
    public let subject: String
    public let confidence: ConfidenceLevel
    public let definition: String
    public let simpleExplanation: String
    public let analogy: String?
    public let funFact: String?
    public let observations: [VisualObservation]
    public let followUpQuestions: [String]
    public let category: SubjectCategory

    nonisolated public init(
        id: UUID = UUID(),
        subject: String,
        confidence: ConfidenceLevel,
        definition: String,
        simpleExplanation: String,
        analogy: String? = nil,
        funFact: String? = nil,
        observations: [VisualObservation] = [],
        followUpQuestions: [String] = [],
        category: SubjectCategory = .unknown
    ) {
        self.id = id
        self.subject = subject
        self.confidence = confidence
        self.definition = definition
        self.simpleExplanation = simpleExplanation
        self.analogy = analogy
        self.funFact = funFact
        self.observations = observations
        self.followUpQuestions = followUpQuestions
        self.category = category
    }
}
