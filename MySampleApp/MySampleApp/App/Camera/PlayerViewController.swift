import UIKit
import AVFoundation
import GoogleAPIClient
import GTMOAuth2

class PlayerViewController: UIViewController {

    @IBOutlet weak var playerView: PlayerView!
    let player = AVPlayer()
    var asset: AVURLAsset? {
        didSet {
            guard let newAsset = asset else { return }
            asynchronouslyLoadURLAsset(newAsset)
        }
    }
    var playerItem: AVPlayerItem? = nil {
        didSet {
            player.replaceCurrentItemWithPlayerItem(self.playerItem)
        }
    }
    private var playerLayer: AVPlayerLayer? {
        return playerView.playerLayer
    }
    let keyChainName = "CameraRecord"
    //let clientID = "449392154913-obh7qiq70kdqhuobkh6oh0l7kjh77sik.apps.googleusercontent.com"
    let clientID = ""
    lazy var services:GTLServiceDrive = {
        if let auth = GTMOAuth2ViewControllerTouch.authForGoogleFromKeychainForName(self.keyChainName, clientID: self.clientID, clientSecret: nil) {
            $0.authorizer = auth
        }
        return $0
    }(GTLServiceDrive())


    var urlFile:NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        asset = AVURLAsset(URL: urlFile!, options: nil)
        playerView.playerLayer.player = player // should be this other
    }

    @IBAction func touchUpCloseButton(_ sender: UIButton) {
        player.pause()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func touchUpPlayButton(_ playerButton: UIButton) {
        //playerButton.isEnabled = false
        player.play()
    }
   
    @IBAction func touchUpUpLoadButton(_ uploadButton: UIButton) {
        //uploadButton.isEnabled = false
        uploadRecord()
    }
}

extension PlayerViewController{
    func asynchronouslyLoadURLAsset(_ newAsset: AVURLAsset) {
        newAsset.loadValuesAsynchronouslyForKeys([]) {
            dispatch_async(dispatch_get_main_queue(), {
                guard newAsset == self.asset else {
                    return
                }
                self.playerItem = AVPlayerItem(asset: newAsset)
            }
        )
        }
    }
    
    func uploadRecord(){
        _ = GTLUploadParameters(fileURL: urlFile!, MIMEType: "mov")
    }

}











