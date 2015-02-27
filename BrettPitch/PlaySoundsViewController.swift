//
//  PlaySoundsViewController.swift
//  BrettPitch
//
//  Created by Brett Jurman on 2/26/15.
//  Copyright (c) 2015 Brett Jurman. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var player: AVAudioPlayer!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioEngine = AVAudioEngine()
    }
    
    func setSoundURL(url: NSURL?) {
        player = AVAudioPlayer(contentsOfURL: url, error: nil);
        audioFile = AVAudioFile(forReading: url, error: nil)
        player.enableRate = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playPitch(pitch: Float) {
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        audioEngine.stop()
        player.stop()
        audioEngine.reset()
        
        var pitchChanger = AVAudioUnitTimePitch();
        pitchChanger.pitch = pitch;
        audioEngine.attachNode(pitchChanger)
        audioEngine.connect(audioPlayerNode, to: pitchChanger, format: nil)
        audioEngine.connect(pitchChanger, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(
            audioFile,
            atTime: nil,
            completionHandler: nil
        )
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
    }
    
    @IBAction func playDarth(sender: UIButton) {
        player.rate = 1.0
        playPitch(-1000)
    }
    
    @IBAction func playChipmunk(sender: UIButton) {
        player.rate = 1.0
        playPitch(1000)
    }
    
    @IBAction func playFast(sender: UIButton) {
        player.rate = 2.0
        player.play()
    }
   
    @IBAction func playSlow(sender: UIButton) {
        player.rate = 0.5
        player.play()
    }
}
