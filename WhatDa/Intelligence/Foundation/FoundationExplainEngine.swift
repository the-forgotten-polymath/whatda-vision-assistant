//
//  FoundationExplainEngine.swift
//  WhatDa
//
//  Created by Antigravity.
//

import Foundation
import UIKit
import CoreGraphics
import ImageIO

#if canImport(FoundationModels)
import FoundationModels

@available(iOS 26.0, macOS 15.0, *)
public final actor FoundationExplainEngine: ExplainEngine {
    
    public init() {}
    
    public func explain(image: CapturedImage, context: VisualContext) async throws -> ExplanationResult {
        let model = SystemLanguageModel.default
        
        switch model.availability {
        case .available:
            print("🟢 Apple Intelligence Foundation Model is available and ready.")
        case .unavailable(.appleIntelligenceNotEnabled):
            print("🔴 Apple Intelligence is NOT enabled in device settings.")
        case .unavailable(.deviceNotEligible):
            print("🔴 This device (or region) is NOT eligible for Apple Intelligence.")
        case .unavailable(.modelNotReady):
            print("🟡 Apple Intelligence model is still downloading or not ready yet.")
        default:
            print("🔴 Apple Intelligence is unavailable (Unknown reason).")
        }
        
        guard model.availability == .available else {
            return ExplanationResult(
                subject: "Your Settings App",
                confidence: .high,
                definition: "A system menu where you apparently forgot to flip a very important switch.",
                simpleExplanation: "Look, I can't analyze this image if my brain is turned off. Please go to Settings > Apple Intelligence & Siri and actually enable it. I'll wait.",
                analogy: "Think of it like trying to drive a Ferrari with no gas.",
                funFact: "Apple Intelligence is completely free, yet you still haven't turned it on.",
                observations: context.observations,
                followUpQuestions: ["Why did I think this would work without turning it on?", "Where is the Settings app?"],
                category: .technology
            )
        }
        
        let instructions = PromptLibrary.systemPrompt
        let session = LanguageModelSession(model: model, instructions: instructions)
        
        let cgImage = await MainActor.run { image.cgImage }
        guard let cgImage else {
            throw NSError(domain: "FoundationExplainEngine", code: 1, userInfo: [NSLocalizedDescriptionKey: "No CGImage available for analysis"])
        }
        
        let promptText = PromptLibrary.buildUserPrompt(from: context)
        
        // Structured generation using respond(generating:) + PromptBuilder
        let response = try await session.respond(generating: GeneratedExplanation.self) {
            promptText
        }
        let generated = response.content
        
        return ExplanationResult(
            subject: generated.subject,
            confidence: generated.confidence.toAppConfidence(),
            definition: generated.definition,
            simpleExplanation: generated.simpleExplanation,
            analogy: generated.analogy,
            funFact: generated.funFact,
            observations: context.observations,
            followUpQuestions: generated.followUpQuestions,
            category: generated.category.toAppCategory()
        )
    }
    
}
#endif

