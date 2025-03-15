//
//  CameraPermission.swift
//  WhatDa
//

import AVFoundation

public enum CameraPermission: Sendable, Equatable {
    case notDetermined
    case authorized
    case denied
    case restricted

    public static var current: CameraPermission {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return .authorized
        case .notDetermined:
            return .notDetermined
        case .denied:
            return .denied
        case .restricted:
            return .restricted
        @unknown default:
            return .denied
        }
    }

    public static func request() async -> CameraPermission {
        let granted = await AVCaptureDevice.requestAccess(for: .video)
        return granted ? .authorized : .denied
    }
}
