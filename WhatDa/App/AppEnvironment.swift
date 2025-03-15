//
//  AppEnvironment.swift
//  WhatDa
//

import SwiftData
import SwiftUI

@MainActor
public final class AppEnvironment {
    public let cameraService: any CameraService
    public let visionAnalyzer: any VisionAnalyzer
    public let explainEngine: any ExplainEngine
    public let imageStore: any ImageStoring
    public let modelContainer: ModelContainer

    public static let shared = AppEnvironment(
        cameraService: DefaultCameraService(),
        visionAnalyzer: DefaultVisionAnalyzer(),
        explainEngine: createExplainEngine(),
        imageStore: ImageStore.shared,
        modelContainer: ModelContainerFactory.create()
    )

    public init(
        cameraService: any CameraService,
        visionAnalyzer: any VisionAnalyzer,
        explainEngine: any ExplainEngine,
        imageStore: any ImageStoring,
        modelContainer: ModelContainer
    ) {
        self.cameraService = cameraService
        self.visionAnalyzer = visionAnalyzer
        self.explainEngine = explainEngine
        self.imageStore = imageStore
        self.modelContainer = modelContainer
    }
    
    private static func createExplainEngine() -> any ExplainEngine {
        #if canImport(FoundationModels)
        if #available(iOS 26.0, macOS 15.0, *) {
            print("🚀 [ExplainEngine] Using FoundationExplainEngine (Apple Intelligence)")
            return FoundationExplainEngine()
        }
        #endif
        print("⚙️ [ExplainEngine] Using DefaultExplainEngine (Heuristics)")
        return DefaultExplainEngine()
    }
}
