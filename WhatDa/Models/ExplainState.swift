//
//  ExplainState.swift
//  WhatDa
//

import Foundation

public enum ExplainState: Equatable {
    case ready
    case capturing
    case analyzing(String)
    case generating(String)
    case complete(ExplanationResult)
    case failed(String)
}
