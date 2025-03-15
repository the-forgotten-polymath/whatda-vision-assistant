//
//  AppTypography.swift
//  WhatDa
//

import SwiftUI

public enum AppTypography {
    public static let brandTitle = Font.system(.title, design: .rounded).weight(.black)
    public static let heroSubject = Font.system(.largeTitle, design: .rounded).weight(.bold)
    public static let cardHeader = Font.system(.footnote, design: .rounded).weight(.bold)
    public static let definition = Font.system(.body, design: .default).weight(.medium)
    public static let simpleExplanation = Font.system(.body, design: .rounded)
    public static let chipLabel = Font.system(.subheadline, design: .rounded).weight(.medium)
    public static let captionNotice = Font.system(.caption, design: .default)
}
