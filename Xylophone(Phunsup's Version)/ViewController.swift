//
//  ViewController.swift
//  Xylophone(Phunsup's Version)
//
//  Created by Phunsup S. on 5/3/2567 BE.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundName: String) {
        if let url = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found.")
        }
    }

    
}

