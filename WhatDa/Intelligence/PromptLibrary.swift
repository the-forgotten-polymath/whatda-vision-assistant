//
//  PromptLibrary.swift
//  WhatDa
//

import Foundation

public enum PromptLibrary: Sendable {
    public nonisolated static let systemPrompt = """
    Explain like I am 5.
    - Follow-up Questions: Provide 3-4 natural curiosity questions for further exploration.
    
    """

    public nonisolated static func buildUserPrompt(from context: VisualContext) -> String {
        var prompt = "Identify and explain the main subject in this photo in ELI5 terms."
        
        if let barcode = context.barcodes.first {
            prompt += "\nDetected barcode: \(barcode.payload)"
        }
        
        return prompt
    }
}
