import UIKit
import AVFoundation

class CameraView: UIView {
    var videoPreviewLayer: AVCaptureVideoPreviewLayer{
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    var session : AVCaptureSession?{
        get {
            return videoPreviewLayer.session
        }
        set {
            videoPreviewLayer.session = newValue
        }
    }
    override class func layerClass() -> AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
}
