//
//  CameraService.swift
//  WhatDa
//

import AVFoundation
import UIKit

public protocol CameraService: AnyObject, Sendable {
    var captureSession: AVCaptureSession { get }
    func start() async throws
    func stop() async
    func capturePhoto() async throws -> CapturedImage
    func toggleTorch(isOn: Bool) async throws
}

public enum CameraError: LocalizedError, Sendable {
    case deviceUnavailable
    case cannotAddInput
    case cannotAddOutput
    case captureFailed
    case permissionDenied
    case invalidImageData

    public var errorDescription: String? {
        switch self {
        case .deviceUnavailable:
            return "Camera is not available on this device."
        case .cannotAddInput:
            return "Unable to access the camera feed."
        case .cannotAddOutput:
            return "Unable to configure photo capture."
        case .captureFailed:
            return "Failed to capture photo."
        case .permissionDenied:
            return "Camera access was denied."
        case .invalidImageData:
            return "Captured photo data was invalid."
        }
    }
}

public final class DefaultCameraService: NSObject, CameraService, @unchecked Sendable {
    public let captureSession = AVCaptureSession()
    private let photoOutput = AVCapturePhotoOutput()
    private let sessionQueue = DispatchQueue(label: "com.chitransh.WhatDa.cameraQueue")
    
    private var activeDevice: AVCaptureDevice?
    private var isConfigured = false
    private var activeContinuation: CheckedContinuation<CapturedImage, Error>?

    public override init() {
        super.init()
    }

    public func start() async throws {
        var status = CameraPermission.current
        if status == .notDetermined {
            status = await CameraPermission.request()
        }
        guard status == .authorized else {
            throw CameraError.permissionDenied
        }

        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            sessionQueue.async { [weak self] in
                guard let self = self else {
                    continuation.resume()
                    return
                }

                do {
                    if !self.isConfigured {
                        try self.configureSession()
                    }
                    if !self.captureSession.isRunning {
                        self.captureSession.startRunning()
                    }
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public func stop() async {
        await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
            sessionQueue.async { [weak self] in
                guard let self = self else {
                    continuation.resume()
                    return
                }
                if self.captureSession.isRunning {
                    self.captureSession.stopRunning()
                }
                continuation.resume()
            }
        }
    }

    public func capturePhoto() async throws -> CapturedImage {
        guard captureSession.isRunning else {
            throw CameraError.captureFailed
        }

        return try await withCheckedThrowingContinuation { continuation in
            sessionQueue.async { [weak self] in
                guard let self = self else {
                    continuation.resume(throwing: CameraError.captureFailed)
                    return
                }

                self.activeContinuation = continuation
                let settings = AVCapturePhotoSettings()
                if let device = self.activeDevice, device.hasFlash {
                    settings.flashMode = .auto
                }

                if let connection = self.photoOutput.connection(with: .video), connection.isVideoOrientationSupported {
                    connection.videoOrientation = .portrait
                }

                self.photoOutput.capturePhoto(with: settings, delegate: self)
            }
        }
    }

    public func toggleTorch(isOn: Bool) async throws {
        guard let device = activeDevice, device.hasTorch else { return }
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            sessionQueue.async {
                do {
                    try device.lockForConfiguration()
                    device.torchMode = isOn ? .on : .off
                    device.unlockForConfiguration()
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func configureSession() throws {
        captureSession.beginConfiguration()
        captureSession.sessionPreset = .photo

        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            captureSession.commitConfiguration()
            throw CameraError.deviceUnavailable
        }
        self.activeDevice = camera

        let input = try AVCaptureDeviceInput(device: camera)
        guard captureSession.canAddInput(input) else {
            captureSession.commitConfiguration()
            throw CameraError.cannotAddInput
        }
        captureSession.addInput(input)

        guard captureSession.canAddOutput(photoOutput) else {
            captureSession.commitConfiguration()
            throw CameraError.cannotAddOutput
        }
        captureSession.addOutput(photoOutput)
        if #available(iOS 17.0, *) {
            photoOutput.maxPhotoDimensions = input.device.activeFormat.supportedMaxPhotoDimensions.last ?? CMVideoDimensions(width: 0, height: 0)
        } else {
            photoOutput.isHighResolutionCaptureEnabled = true
        }

        captureSession.commitConfiguration()
        self.isConfigured = true
    }
}

extension DefaultCameraService: AVCapturePhotoCaptureDelegate {
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            activeContinuation?.resume(throwing: error)
            activeContinuation = nil
            return
        }

        guard let data = photo.fileDataRepresentation(),
              let image = UIImage(data: data) else {
            activeContinuation?.resume(throwing: CameraError.invalidImageData)
            activeContinuation = nil
            return
        }

        // Use the raw image directly since video orientation is set to .portrait on the connection
        let captured = CapturedImage(uiImage: image, source: .camera)
        activeContinuation?.resume(returning: captured)
        activeContinuation = nil
    }
}

