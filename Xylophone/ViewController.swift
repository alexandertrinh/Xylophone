import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    var buttonName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(letter: String) {
        let url = Bundle.main.url(forResource: letter, withExtension: "wav")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try! AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        buttonName = sender.currentTitle
        playSound(letter: buttonName!)
    }
}

