//
//  ProgressPillView.swift
//  WhatDa
//

import SwiftUI

public struct ProgressPillView: View {
    public let title: String
    @State private var fillProgress: CGFloat = 0.15
    @State private var isPulsing: Bool = false

    public init(title: String = "Looking closely...") {
        self.title = title
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            // Capsule Background (Glassmorphic)
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay(
                    Capsule()
                        .stroke(Color.white.opacity(0.18), lineWidth: 1)
                )

            // Dynamic Fill Track
            GeometryReader { geometry in
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [
                                AppColors.brandYellow.opacity(0.0),
                                AppColors.brandYellow.opacity(0.8),
                                AppColors.brandYellow.opacity(0.0)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: geometry.size.width * 0.6)
                    .offset(x: isPulsing ? geometry.size.width : -geometry.size.width * 0.6)
                    .animation(.linear(duration: 1.2).repeatForever(autoreverses: false), value: isPulsing)
            }
            .clipShape(Capsule())

            // Content Label
            HStack(spacing: 10) {
                Image(systemName: "sparkle")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(AppColors.brandYellow)
                    .rotationEffect(.degrees(isPulsing ? 15 : -15))

                Text(title)
                    .font(AppTypography.cardHeader)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)

                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .frame(width: 220, height: 44)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 4)
        .onAppear {
            isPulsing = true
        }
    }
}

#Preview {
    ZStack {
        Color.black
        ProgressPillView()
    }
}
