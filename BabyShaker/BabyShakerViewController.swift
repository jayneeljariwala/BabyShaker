//
//  ViewController.swift
//  BabyShaker
//
//  Created by Jayneel Jariwala on 07/09/24.
//

import UIKit
import AVFoundation

class BabyShakerViewController: UIViewController {
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var babyImage: UIImageView!
    @IBOutlet var playAgainButton: UIButton!
    var babyImageList = ["baby1", "baby2", "baby3", "baby3"]
    var currentBaby: String!
    var timer: Timer?
    var startTime: TimeInterval?
    var audioPlayer: AVAudioPlayer!
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        playAgainButton.isHidden = true
        self.becomeFirstResponder()
        
        initSetup()
    }
    
    func initSetup() {
        playAgainButton.isHidden = true
        startTimer()
        playSound(soundName: "babyCry", extensioName: "mp3", loopCount: -1)
        currentBaby = babyImageList.randomElement()!
        babyImage.image = .init(named: currentBaby)
        
    }
    
    func playSound(soundName: String, extensioName: String, loopCount: Int) {
        let url = Bundle.main.url(forResource: soundName, withExtension: extensioName)
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.numberOfLoops = loopCount
        audioPlayer.play()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            timer?.invalidate()
            babyImage.image = .init(named: "\(currentBaby!)dead")
            playAgainButton.isHidden = false
            audioPlayer.stop()
            playSound(soundName: "dead", extensioName: "mp3", loopCount: 0)
        }
    }
    
    func startTimer() {
        startTime = Date().timeIntervalSinceReferenceDate
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Function to update the timer
    @objc func updateTimer() {
        guard let startTime = startTime else { return }
        
        let currentTime = Date().timeIntervalSinceReferenceDate
        let elapsedTime = currentTime - startTime
        
        let hours = Int(elapsedTime / 3600)
        let minutes = Int((elapsedTime / 60).truncatingRemainder(dividingBy: 60))
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int((elapsedTime * 1000).truncatingRemainder(dividingBy: 1000))
        
        timerLabel.text = String(format: "%02d:%02d:%02d.%03d", hours, minutes, seconds, milliseconds)
    }
    
    // Invalidate the timer when view disappears or not needed
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    @IBAction func playAgainTapped(_ sender: UIButton) {
        initSetup()
    }
    
}

