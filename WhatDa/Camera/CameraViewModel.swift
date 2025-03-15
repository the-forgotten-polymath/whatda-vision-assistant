//
//  CameraViewModel.swift
//  WhatDa
//

import PhotosUI
import SwiftUI

@MainActor
@Observable
public final class CameraViewModel {
    public let cameraService: any CameraService
    public let visionAnalyzer: any VisionAnalyzer
    public let explainEngine: any ExplainEngine

    public var permissionStatus: CameraPermission = .notDetermined
    public var isSessionRunning: Bool = false
    public var isCapturing: Bool = false
    public var isTorchOn: Bool = false
    public var capturedImage: CapturedImage?
    public var visualContext: VisualContext?
    public var explanationResult: ExplanationResult?
    public var explainState: ExplainState = .ready
    public var errorMessage: String?

    // PhotosPicker integration
    public var selectedPhotoItem: PhotosPickerItem? {
        didSet {
            if let selectedPhotoItem {
                Task {
                    await loadPickedPhoto(from: selectedPhotoItem)
                }
            }
        }
    }

    public init(
        cameraService: (any CameraService)? = nil,
        visionAnalyzer: (any VisionAnalyzer)? = nil,
        explainEngine: (any ExplainEngine)? = nil
    ) {
        let env = AppEnvironment.shared
        self.cameraService = cameraService ?? env.cameraService
        self.visionAnalyzer = visionAnalyzer ?? env.visionAnalyzer
        self.explainEngine = explainEngine ?? env.explainEngine
        self.permissionStatus = CameraPermission.current
    }

    public func onAppear() async {
        await checkPermissionAndStart()
    }

    public func onDisappear() async {
        await stopCamera()
    }

    public func checkPermissionAndStart() async {
        let current = CameraPermission.current
        self.permissionStatus = current

        switch current {
        case .authorized:
            await startCamera()
        case .notDetermined:
            let requested = await CameraPermission.request()
            self.permissionStatus = requested
            if requested == .authorized {
                await startCamera()
            }
        case .denied, .restricted:
            break
        }
    }

    public func startCamera() async {
        do {
            try await cameraService.start()
            self.isSessionRunning = true
            self.errorMessage = nil
        } catch {
            self.errorMessage = error.localizedDescription
            self.isSessionRunning = false
        }
    }

    public func stopCamera() async {
        await cameraService.stop()
        self.isSessionRunning = false
        if isTorchOn {
            try? await cameraService.toggleTorch(isOn: false)
            self.isTorchOn = false
        }
    }

    public func capturePhoto() async {
        guard !isCapturing else { return }
        isCapturing = true
        explainState = .capturing
        Haptics.shutter()

        do {
            let image = try await cameraService.capturePhoto()
            self.capturedImage = image
            self.isCapturing = false
            await runVisionAnalysis(for: image)
        } catch {
            self.errorMessage = error.localizedDescription
            self.isCapturing = false
            self.explainState = .failed(error.localizedDescription)
            Haptics.error()
        }
    }

    public func runVisionAnalysis(for image: CapturedImage) async {
        self.visualContext = nil
        self.explanationResult = nil
        self.explainState = .analyzing("Looking closely...")

        do {
            let context = try await visionAnalyzer.analyze(image)
            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                self.visualContext = context
                self.explainState = .analyzing("Figuring this out...")
            }

            // Run Explain Engine
            let result = try await explainEngine.explain(image: image, context: context)
            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                self.explanationResult = result
                self.explainState = .ready
            }
            Haptics.success()
        } catch {
            withAnimation {
                self.errorMessage = error.localizedDescription
                self.explainState = .failed("Vision analysis failed: \(error.localizedDescription)")
            }
            Haptics.error()
        }
    }

    public func toggleTorch() async {
        let newState = !isTorchOn
        do {
            try await cameraService.toggleTorch(isOn: newState)
            self.isTorchOn = newState
            Haptics.selection()
        } catch {
            // Torch may not be available on some cameras or simulators
        }
    }

    public func clearCapturedImage() {
        self.capturedImage = nil
        self.visualContext = nil
        self.explanationResult = nil
        self.explainState = .ready
        self.errorMessage = nil
    }

    private func loadPickedPhoto(from item: PhotosPickerItem) async {
        do {
            guard let data = try await item.loadTransferable(type: Data.self),
                  let uiImage = UIImage(data: data) else {
                return
            }
            Haptics.tap()
            let image = CapturedImage(uiImage: uiImage, source: .photoLibrary)
            self.capturedImage = image
            await runVisionAnalysis(for: image)
        } catch {
            self.errorMessage = "Failed to load photo: \(error.localizedDescription)"
        }
    }
}
