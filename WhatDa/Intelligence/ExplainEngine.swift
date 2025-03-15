//
//  ExplainEngine.swift
//  WhatDa
//

import Foundation

public protocol ExplainEngine: Sendable {
    func explain(image: CapturedImage, context: VisualContext) async throws -> ExplanationResult
}
