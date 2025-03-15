//
//  ModelContainerFactory.swift
//  WhatDa
//

import Foundation
import SwiftData

public enum ModelContainerFactory {
    public static func create(isInMemory: Bool = false) -> ModelContainer {
        let schema = Schema([
            Scan.self,
            StoredMessage.self
        ])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: isInMemory)
        do {
            return try ModelContainer(for: schema, configurations: [configuration])
        } catch {
            fatalError("Failed to initialize SwiftData ModelContainer: \(error)")
        }
    }
}
