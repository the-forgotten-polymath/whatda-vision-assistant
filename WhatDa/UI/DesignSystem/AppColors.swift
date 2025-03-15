//
//  AppColors.swift
//  WhatDa
//

import SwiftUI

public enum AppColors {
    // Brand & Chrome
    public static let brandYellow = Color(red: 1.0, green: 0.85, blue: 0.2) // High-contrast playful curiosity
    public static let chromeOverlay = Color.black.opacity(0.4)
    public static let pillBackground = Color.black.opacity(0.6)
    
    // Cards & Surfaces
    public static let cardBackground = Color(uiColor: .secondarySystemBackground)
    public static let cardElevated = Color(uiColor: .tertiarySystemBackground)
    public static let chipBackground = Color(uiColor: .secondarySystemFill)
    public static let chipSelected = Color(uiColor: .label)
    
    // Confidence Badges
    public static let confidenceHigh = Color.green
    public static let confidenceMedium = Color.orange
    public static let confidenceLow = Color.secondary
}
