import UIKit
import Foundation
import AVFoundation

public struct EasyFlash {
    public static func flashOff() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { return }

        do {
            try device.lockForConfiguration()
            device.torchMode = AVCaptureDevice.TorchMode.off

            device.unlockForConfiguration()
        } catch {
            print(error)
        }
    }
    
    public static func flashOn() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { return }

        do {
            try device.lockForConfiguration()
            try device.setTorchModeOn(level: 1.0)
        } catch {
            print(error)
        }
    }
}
