//
//  SubjectCategory.swift
//  WhatDa
//

import Foundation

public enum SubjectCategory: String, Sendable, Codable, CaseIterable {
    case object
    case animal
    case plant
    case food
    case vehicle
    case technology
    case architecture
    case document
    case diagram
    case artwork
    case text
    case person
    case unknown

    public var displayName: String {
        rawValue.capitalized
    }

    public var iconName: String {
        switch self {
        case .object: return "cube.fill"
        case .animal: return "pawprint.fill"
        case .plant: return "leaf.fill"
        case .food: return "fork.knife"
        case .vehicle: return "car.fill"
        case .technology: return "desktopcomputer"
        case .architecture: return "building.2.fill"
        case .document: return "doc.text.fill"
        case .diagram: return "chart.bar.xaxis"
        case .artwork: return "paintpalette.fill"
        case .text: return "character.cursor.ibeam"
        case .person: return "person.fill"
        case .unknown: return "questionmark.circle.fill"
        }
    }
}
