//
//  ExplanationView.swift
//  WhatDa
//

import SwiftUI

public struct ExplanationView: View {
    public let result: ExplanationResult
    public let onRetake: () -> Void
    public var onSelectQuestion: ((String) -> Void)? = nil

    public init(
        result: ExplanationResult,
        onRetake: @escaping () -> Void,
        onSelectQuestion: ((String) -> Void)? = nil
    ) {
        self.result = result
        self.onRetake = onRetake
        self.onSelectQuestion = onSelectQuestion
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Header: Category & Confidence
                HStack {
                    Label(result.category.displayName, systemImage: result.category.iconName)
                        .font(AppTypography.captionNotice)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(AppColors.brandYellow.opacity(0.2), in: Capsule())
                        .foregroundStyle(AppColors.brandYellow)

                    Spacer()

                    HStack(spacing: 4) {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundStyle(AppColors.brandYellow)
                        Text(result.confidence.displayName)
                            .font(AppTypography.captionNotice)
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.white.opacity(0.1), in: Capsule())
                }

                // Subject Title
                Text(result.subject)
                    .font(AppTypography.heroSubject)
                    .foregroundStyle(.white)

                // 1. WHAT IS IT? Card (Technical Definition)
                VStack(alignment: .leading, spacing: 8) {
                    Label("WHAT IS IT?", systemImage: "book.closed.fill")
                        .font(AppTypography.cardHeader)
                        .foregroundStyle(AppColors.brandYellow)

                    Text(result.definition)
                        .font(AppTypography.definition)
                        .foregroundStyle(.white.opacity(0.95))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Color(red: 0.12, green: 0.12, blue: 0.15).opacity(0.92))
                        .overlay(RoundedRectangle(cornerRadius: 18, style: .continuous).stroke(Color.white.opacity(0.12), lineWidth: 1))
                )

                // 2. EXPLAIN IT SIMPLY Card
                VStack(alignment: .leading, spacing: 12) {
                    Label("EXPLAIN IT SIMPLY", systemImage: "lightbulb.fill")
                        .font(AppTypography.cardHeader)
                        .foregroundStyle(AppColors.brandYellow)

                    Text(result.simpleExplanation)
                        .font(AppTypography.simpleExplanation)
                        .foregroundStyle(.white)
                        .fixedSize(horizontal: false, vertical: true)

                    if let analogy = result.analogy {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("THINK OF IT LIKE...")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundStyle(AppColors.brandYellow.opacity(0.9))

                            Text(analogy)
                                .font(AppTypography.definition)
                                .foregroundStyle(.white.opacity(0.9))
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Color(red: 0.12, green: 0.12, blue: 0.15).opacity(0.92))
                        .overlay(RoundedRectangle(cornerRadius: 18, style: .continuous).stroke(Color.white.opacity(0.12), lineWidth: 1))
                )

                // 3. DID YOU KNOW? (Fun Fact)
                if let funFact = result.funFact {
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "sparkles")
                            .font(.title3)
                            .foregroundStyle(AppColors.brandYellow)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("DID YOU KNOW?")
                                .font(AppTypography.cardHeader)
                                .foregroundStyle(AppColors.brandYellow)
                            Text(funFact)
                                .font(AppTypography.definition)
                                .foregroundStyle(.white.opacity(0.9))
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color.black.opacity(0.6))
                            .overlay(RoundedRectangle(cornerRadius: 18, style: .continuous).stroke(AppColors.brandYellow.opacity(0.3), lineWidth: 1))
                    )
                }

                // 4. WANT TO KNOW MORE? (Follow-up chips)
                if !result.followUpQuestions.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("WANT TO KNOW MORE?")
                            .font(AppTypography.cardHeader)
                            .foregroundStyle(.white.opacity(0.7))

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(result.followUpQuestions, id: \.self) { question in
                                    Button(action: {
                                        Haptics.tap()
                                        onSelectQuestion?(question)
                                    }) {
                                        HStack(spacing: 6) {
                                            Image(systemName: "bubble.left.and.bubble.right.fill")
                                                .font(.system(size: 12))
                                            Text(question)
                                                .font(AppTypography.chipLabel)
                                        }
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 10)
                                        .background(Color.white.opacity(0.15), in: Capsule())
                                        .overlay(Capsule().stroke(Color.white.opacity(0.2), lineWidth: 1))
                                    }
                                }
                            }
                        }
                    }
                }

                // Action Bar: Retake & Share
                HStack(spacing: 12) {
                    Button(action: {
                        Haptics.tap()
                        onRetake()
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "camera.fill")
                            Text("Retake Photo")
                        }
                        .font(AppTypography.chipLabel)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(AppColors.brandYellow, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    }

                    ShareLink(
                        item: "\(result.subject)\n\n\(result.definition)\n\nShared via WATDA?!",
                        subject: Text(result.subject),
                        message: Text(result.simpleExplanation)
                    ) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.white.opacity(0.15), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(Color.white.opacity(0.2), lineWidth: 1))
                    }
                }
                .padding(.top, 8)
            }
            .padding(16)
        }
        .background(Color.black.opacity(0.4))
    }
}
