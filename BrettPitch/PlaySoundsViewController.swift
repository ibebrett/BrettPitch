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
    var player: AVAudioPlayer!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            player = AVAudioPlayer(contentsOfURL: NSURL.fileURLWithPath(filePath), error: nil);
        }
        player.enableRate = true;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playSlow(sender: UIButton) {
        player.rate = 0.5;
        player.play();
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
