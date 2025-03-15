//
//  ChatMessage.swift
//  WhatDa
//

import Foundation

public struct ChatMessage: Sendable, Equatable, Identifiable, Codable {
    public let id: UUID
    public let sender: MessageSender
    public let content: String
    public let timestamp: Date

    public enum MessageSender: String, Sendable, Codable {
        case user
        case assistant
    }

    public init(id: UUID = UUID(), sender: MessageSender, content: String, timestamp: Date = Date()) {
        self.id = id
        self.sender = sender
        self.content = content
        self.timestamp = timestamp
    }
}
