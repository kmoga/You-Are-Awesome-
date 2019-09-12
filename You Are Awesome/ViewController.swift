//
//  ViewController.swift
//  You Are Awesome
//
//  Created by SBAUser on 9/12/19.
//  Copyright © 2019 Kyle Moga. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    
    
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageIndex = -1
    var soundIndex = -1
    let numberofSounds = 6
    let numberofImages = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func nonRepeatingRandom (lastNumber: Int, maxValue: Int) -> Int {
        var newIndex: Int
        repeat {
            newIndex = Int.random(in: 0..<maxValue)
        } while lastNumber == newIndex
        return newIndex
    }
    
    func playSound(soundName: String, audioPlayer:  inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else {
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
    if soundSwitch.isOn == false && soundIndex != -1 {
            awesomePlayer.stop()
        }
    }
    

    @IBAction func showMessagePressed(_ sender: UIButton) {
    let messages =  ["You Are Awesome!",
                         "You Are Great!",
                         "You Are Fantastic!",
                         "When the Apple Genius Bar needs help, they call you",
                         "You brighten my day!",
                         "You da bomb",
                         "Hey, fabulous!",
                         "You are tremendous!",
                         "You've got the design skills of Jony Ive!",
                         "I can't wait to download your app!"]
        
        // Show Text
        
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //Show Image
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numberofImages)
        awesomeImage.image = UIImage(named: "img\(imageIndex)")
        
        //        if soundSwitch.isOn == true {
        if soundSwitch.isOn {
            
            //random Sound
            soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numberofSounds)
            
            //Play Sound
            let soundName = "sound\(soundIndex)"
            
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
        
    }
    

}
