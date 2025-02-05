//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    var myPlyer: AVAudioPlayer!
    
    let sounds = ["A", "B", "C", "D", "E", "F", "G"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioSession()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        var soundName = sender.currentTitle ?? sounds.randomElement()!
        print("start")
        sender.alpha = 0.5
        playSound(fileName: soundName)
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        print("End")
    }
    
    
    
    func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Audio session setup failed: \(error.localizedDescription)")
        }
    }
    
    func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else {
            print("Sound file \(fileName) not found.")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func playMySound(fileName: String){
        let url = Bundle.main.url(forResource: fileName, withExtension: "wav")
        myPlyer = try! AVAudioPlayer(contentsOf: url!)
        myPlyer.play()
    }
    
}

