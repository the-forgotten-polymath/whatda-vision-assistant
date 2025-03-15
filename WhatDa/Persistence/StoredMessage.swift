//
//  StoredMessage.swift
//  WhatDa
//

import Foundation
import SwiftData

@Model
public final class StoredMessage {
    @Attribute(.unique)
    public var id: UUID
    public var roleRawValue: String
    public var content: String
    public var timestamp: Date

    public var scan: Scan?

    public init(id: UUID = UUID(), roleRawValue: String, content: String, timestamp: Date = Date(), scan: Scan? = nil) {
        self.id = id
        self.roleRawValue = roleRawValue
        self.content = content
        self.timestamp = timestamp
        self.scan = scan
    }

    public var toDomain: ChatMessage {
        ChatMessage(
            id: id,
            sender: roleRawValue == ChatMessage.MessageSender.user.rawValue ? .user : .assistant,
            content: content,
            timestamp: timestamp
        )
    }
}
