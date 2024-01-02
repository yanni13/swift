//
//  ViewController.swift
//  stopwatch
//
//  Created by 아우신얀 on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer = Timer()
    var count: Int = 0
    var timerCounting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // startStopButton.setTitleColor(UIColor.green, for:.normal)
        startStopButton.tintColor = .white
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Reset Timer?", message: "Are you sure you would like to reset the Timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler:  { (_) in
            //do nothing
        }))
                        
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler:  { (_) in
            self.count = 0
            self.timer.invalidate()
            self.TimerLabel.text = self.makeTimeString(minutes: 0, seconds: 0)
            //self.startStopButton.setTitle("START", for: .normal)
            self.startStopButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            self.startStopButton.setTitleColor(UIColor.green, for:.normal)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startStopTapped(_ sender: Any) {
        if timerCounting {
            timerCounting = false
            timer.invalidate()
            self.startStopButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            startStopButton.setTitleColor(UIColor.green, for:.normal)
        }
        else {
            timerCounting = true
            self.startStopButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCounter() -> Void {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(count)
        let timeString = makeTimeString(minutes: time.0, seconds: time.1)
        TimerLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int) {
        return ( ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }

}

