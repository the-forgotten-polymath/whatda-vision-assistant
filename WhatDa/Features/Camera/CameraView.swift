//
//  CameraView.swift
//  WhatDa
//

import PhotosUI
import SwiftUI

public struct CameraView: View {
    @State private var viewModel = CameraViewModel()
    @State private var showHistory = false
    @State private var showSettings = false

    public init() {}

    public var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            switch viewModel.permissionStatus {
            case .authorized:
                liveCameraContent
            case .denied, .restricted:
                permissionDeniedView
            case .notDetermined:
                requestingPermissionView
            }
        }
        .task {
            await viewModel.onAppear()
        }
        .onDisappear {
            Task {
                await viewModel.onDisappear()
            }
        }
    }

    // MARK: - Live Camera Content
    @ViewBuilder
    private var liveCameraContent: some View {
        // UI Controls Layer (Strictly respects safe area)
        VStack(spacing: 0) {
            topBar
                .padding(.horizontal, 20)
                .padding(.top, 4)

            Spacer()

            // Overlays at the bottom
            if let result = viewModel.explanationResult {
                ExplanationView(
                    result: result,
                    onRetake: {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                            viewModel.clearCapturedImage()
                        }
                    }
                )
                .frame(maxHeight: 440)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 24, style: .continuous).stroke(Color.white.opacity(0.18), lineWidth: 1))
                .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 10)
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            } else if let context = viewModel.visualContext {
                visionCard(context: context)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            } else if case .analyzing(let message) = viewModel.explainState {
                ProgressPillView(title: message)
                    .padding(.bottom, 36)
                    .transition(.opacity.combined(with: .scale(scale: 0.95)))
            } else if case .failed(let errorMsg) = viewModel.explainState {
                failureView(message: errorMsg)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
            } else if viewModel.capturedImage == nil {
                bottomBar
            }
        }
        .background {
            ZStack {
                // 1. Live Preview Feed (Full bleed)
                CameraPreviewView(session: viewModel.cameraService.captureSession)

                // 2. Freeze Frame Preview if captured (Full bleed + subtle darkening gradient)
                if let captured = viewModel.capturedImage {
                    ZStack {
                        Image(uiImage: captured.uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipped()

                        // Subtle gradient overlay for contrast over bright photos
                        LinearGradient(
                            colors: [
                                Color.black.opacity(0.45),
                                Color.black.opacity(0.1),
                                Color.black.opacity(0.65)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    }
                    .transition(.opacity)
                }
            }
            .ignoresSafeArea()
        }
    }

    // MARK: - Top Bar
    private var topBar: some View {
        HStack(alignment: .center) {
            // Brand Title
            Text("WATDA?!")
                .font(AppTypography.brandTitle)
                .foregroundStyle(AppColors.brandYellow)
                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                .accessibilityAddTraits(.isHeader)

            Spacer()

            HStack(spacing: 12) {
                // Torch Toggle
                Button(action: {
                    Task {
                        await viewModel.toggleTorch()
                    }
                }) {
                    Image(systemName: viewModel.isTorchOn ? "flashlight.on.fill" : "flashlight.off.fill")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(viewModel.isTorchOn ? AppColors.brandYellow : .white)
                        .frame(width: 42, height: 42)
                        .background(Color.black.opacity(0.55), in: Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.15), lineWidth: 1))
                }
                .accessibilityLabel(viewModel.isTorchOn ? "Turn off flashlight" : "Turn on flashlight")

                // History Button (Placeholder for Phase 7)
                Button(action: {
                    Haptics.tap()
                    showHistory = true
                }) {
                    Image(systemName: "clock.arrow.circlepath")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 42, height: 42)
                        .background(Color.black.opacity(0.55), in: Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.15), lineWidth: 1))
                }
                .accessibilityLabel("Scan History")

                // Settings Button (Placeholder for Phase 8)
                Button(action: {
                    Haptics.tap()
                    showSettings = true
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 42, height: 42)
                        .background(Color.black.opacity(0.55), in: Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.15), lineWidth: 1))
                }
                .accessibilityLabel("Settings")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            Capsule()
                .fill(.ultraThinMaterial)
                .environment(\.colorScheme, .dark)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
        )
        .sheet(isPresented: $showHistory) {
            placeholderSheet(title: "History", systemImage: "clock.arrow.circlepath")
        }
        .sheet(isPresented: $showSettings) {
            placeholderSheet(title: "Settings", systemImage: "gearshape.fill")
        }
    }

    // MARK: - Vision Analysis Card
    private func visionCard(context: VisualContext) -> some View {
        VStack(spacing: 12) {
            // Quality warning if dark or blurry
            if !context.imageQuality.isAcceptable {
                HStack(spacing: 6) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundStyle(AppColors.brandYellow)
                    Text(context.imageQuality.isDark ? "Image is quite dark. Try adding some light." : "Image appears blurry. Try holding steady.")
                        .font(AppTypography.captionNotice)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .background(Color.black.opacity(0.85), in: Capsule())
                .overlay(Capsule().stroke(Color.white.opacity(0.15), lineWidth: 1))
            }

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Label("Vision Analysis", systemImage: "sparkles")
                        .font(AppTypography.cardHeader)
                        .foregroundStyle(AppColors.brandYellow)
                    Spacer()
                    Text("\(context.recognizedText.count) lines recognized")
                        .font(AppTypography.captionNotice)
                        .foregroundStyle(.white.opacity(0.85))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.white.opacity(0.14), in: Capsule())
                }

                if let firstBarcode = context.barcodes.first {
                    HStack(spacing: 8) {
                        Image(systemName: "barcode.viewfinder")
                            .foregroundStyle(AppColors.brandYellow)
                        Text(firstBarcode.payload)
                            .font(AppTypography.chipLabel)
                            .foregroundStyle(.white)
                            .lineLimit(1)
                    }
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                }

                if let firstText = context.recognizedText.first {
                    Text("\"\(firstText.text)\"")
                        .font(AppTypography.definition)
                        .foregroundStyle(.white)
                        .lineLimit(2)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                }

                if !context.observations.isEmpty {
                    HStack(spacing: 6) {
                        ForEach(context.observations.prefix(3)) { obs in
                            Text(obs.label)
                                .font(AppTypography.captionNotice)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.white.opacity(0.18), in: Capsule())
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color(red: 0.11, green: 0.11, blue: 0.13).opacity(0.94))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Color.white.opacity(0.18), lineWidth: 1)
                    )
            )
            .shadow(color: Color.black.opacity(0.5), radius: 20, x: 0, y: 10)

            // Retake Action Button
            Button(action: {
                Haptics.tap()
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    viewModel.clearCapturedImage()
                }
            }) {
                HStack(spacing: 8) {
                    Image(systemName: "arrow.counterclockwise")
                    Text("Retake Photo")
                }
                .font(AppTypography.chipLabel)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Color.white.opacity(0.22), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                )
            }
        }
    }

    // MARK: - Failure View
    private func failureView(message: String) -> some View {
        VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 32))
                .foregroundStyle(AppColors.brandYellow)

            Text(message)
                .font(AppTypography.definition)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)

            Button("Try Again") {
                Haptics.tap()
                withAnimation {
                    viewModel.clearCapturedImage()
                }
            }
            .font(AppTypography.chipLabel)
            .foregroundStyle(.black)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(AppColors.brandYellow, in: Capsule())
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.black.opacity(0.85))
                .overlay(RoundedRectangle(cornerRadius: 18, style: .continuous).stroke(Color.white.opacity(0.15), lineWidth: 1))
        )
    }

    // MARK: - Bottom Bar
    private var bottomBar: some View {
        HStack(alignment: .center) {
            // Photos Library Picker
            PhotosPicker(
                selection: $viewModel.selectedPhotoItem,
                matching: .images,
                photoLibrary: .shared()
            ) {
                VStack(spacing: 4) {
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(width: 50, height: 50)
                        .background(Color.black.opacity(0.5), in: Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.15), lineWidth: 1))
                    Text("Photos")
                        .font(.caption2.weight(.medium))
                        .foregroundStyle(.white.opacity(0.8))
                }
            }
            .accessibilityLabel("Select photo from library")

            Spacer()

            // Shutter Button (Primary CTA)
            Button(action: {
                Task {
                    await viewModel.capturePhoto()
                }
            }) {
                ZStack {
                    // Outer Tactile Ring
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width: 78, height: 78)

                    // Inner Shutter Disk
                    Circle()
                        .fill(viewModel.isCapturing ? Color.white.opacity(0.5) : Color.white)
                        .frame(width: 66, height: 66)
                        .scaleEffect(viewModel.isCapturing ? 0.88 : 1.0)
                        .animation(.spring(response: 0.2, dampingFraction: 0.6), value: viewModel.isCapturing)
                }
            }
            .disabled(viewModel.isCapturing)
            .accessibilityLabel("Capture and explain")
            .accessibilityHint("Takes a photo and explains what you're looking at")

            Spacer()

            // Spacer balance
            Color.clear
                .frame(width: 50, height: 50)
        }
        .padding(.horizontal, 36)
        .padding(.bottom, 16)
    }

    // MARK: - Permission Denied View
    private var permissionDeniedView: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: "camera.badge.ellipsis")
                .font(.system(size: 64))
                .foregroundStyle(AppColors.brandYellow)

            VStack(spacing: 8) {
                Text("Camera Access Needed")
                    .font(AppTypography.heroSubject)
                    .foregroundStyle(.white)

                Text("WATDA?! needs your camera to see and explain objects around you. Everything happens 100% on your device.")
                    .font(AppTypography.definition)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white.opacity(0.8))
                    .padding(.horizontal, 32)
            }

            Button(action: {
                Haptics.tap()
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("Open Settings")
                    .font(AppTypography.chipLabel)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(AppColors.brandYellow, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
            .padding(.horizontal, 32)

            Spacer()
        }
    }

    // MARK: - Requesting Permission View
    private var requestingPermissionView: some View {
        VStack(spacing: 16) {
            ProgressView()
                .tint(.white)
            Text("Starting camera...")
                .font(AppTypography.definition)
                .foregroundStyle(.white.opacity(0.8))
        }
    }

    // MARK: - Temporary Placeholder Sheet
    private func placeholderSheet(title: String, systemImage: String) -> some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: systemImage)
                    .font(.system(size: 48))
                    .foregroundStyle(.secondary)
                Text(title)
                    .font(AppTypography.heroSubject)
                Text("Coming in subsequent phases.")
                    .font(AppTypography.captionNotice)
                    .foregroundStyle(.secondary)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Done") {
                        if title == "History" { showHistory = false }
                        if title == "Settings" { showSettings = false }
                    }
                }
            }
        }
    }
}

#Preview {
    CameraView()
}
