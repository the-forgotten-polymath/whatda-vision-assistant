//
//  ImageQualityAnalyzer.swift
//  WhatDa
//

import CoreGraphics
import Foundation
import UIKit
import Vision

public protocol ImageQualityAnalyzing: Sendable {
    func analyze(cgImage: CGImage) async -> ImageQuality
}

public final class ImageQualityAnalyzer: ImageQualityAnalyzing, Sendable {
    public init() {}

    public func analyze(cgImage: CGImage) async -> ImageQuality {
        let stats = calculateLuminanceAndContrast(cgImage: cgImage)
        let isDark = stats.meanLuminance < 0.15
        let isBlurry = stats.variance < 0.003 && !isDark

        return ImageQuality(
            isBlurry: isBlurry,
            isDark: isDark,
            brightness: stats.meanLuminance,
            sharpness: stats.variance * 100
        )
    }

    private struct ImageStats {
        let meanLuminance: Float
        let variance: Float
    }

    private func calculateLuminanceAndContrast(cgImage: CGImage) -> ImageStats {
        let width = 32
        let height = 32
        var pixelData = [UInt8](repeating: 0, count: width * height * 4)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue

        guard let context = CGContext(
            data: &pixelData,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: width * 4,
            space: colorSpace,
            bitmapInfo: bitmapInfo
        ) else {
            return ImageStats(meanLuminance: 0.5, variance: 0.05)
        }

        context.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))

        var luminances = [Float]()
        luminances.reserveCapacity(width * height)

        for i in stride(from: 0, to: pixelData.count, by: 4) {
            let r = Float(pixelData[i]) / 255.0
            let g = Float(pixelData[i + 1]) / 255.0
            let b = Float(pixelData[i + 2]) / 255.0
            let luma = 0.299 * r + 0.587 * g + 0.114 * b
            luminances.append(luma)
        }

        let mean = luminances.reduce(0, +) / Float(luminances.count)
        let sumSquaredDiff = luminances.reduce(0) { $0 + ($1 - mean) * ($1 - mean) }
        let variance = sumSquaredDiff / Float(luminances.count)

        return ImageStats(meanLuminance: mean, variance: variance)
    }
}
