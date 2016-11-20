//
//  ViewController.swift
//  Figure8
//
//  Created by Tamer Deif on 11/20/16.
//
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {
    
    var duration = 15
    var delay = UInt32(500)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "120-2.png")!)
        playSound()
        vibrate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var player: AVAudioPlayer?
    
    func playSound() {
        //let url = Bundle.main.url(forResource: "You're Fierce v5 2", withExtension: "aif")!
        let url = Bundle.main.url(forResource: "13 Let Me Love You (feat. Justin Bieber)", withExtension: "m4a")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func vibrate()
    {
        while (Int(player!.currentTime) < duration) {
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            usleep(delay)
        }
        player?.stop()
    }

}

