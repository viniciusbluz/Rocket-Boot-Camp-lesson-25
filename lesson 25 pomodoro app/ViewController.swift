//
//  ViewController.swift
//  lesson 25 pomodoro app
//
//  Created by Vinicius da Luz on 31/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = timeSelected
    }
    var timer = Timer()
    var isTimerStarted = false
    var time = 1500
    var timeSelected = "25:00"
    var timeTest = 1500
    var timeHitzero: Bool = false
    
    @IBAction func segmentControlOption(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            timeSelected = "25:00"
            timeTest = 1500
            resetTimer()
        case 1:
            timeSelected = "5:00"
            timeTest = 5
            resetTimer()
        case 2:
            timeSelected = "15:00"
            timeTest = 900
            resetTimer()
        default:
            break
        }
        
    }
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
        
    @IBAction func startButtomTapped(_ sender: Any) {
        
        if !isTimerStarted{
            startTimer()
            isTimerStarted = true
            startButton.setTitle("Stop", for: .normal)
        }else{
            resetTimer()
        }
    }
    
    func resetTimer(){
        timer.invalidate()
        time = timeTest
        isTimerStarted = false
        timeLabel.text = timeSelected
        startButton.setTitle("Start", for: .normal)
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updadeTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updadeTimer(){
        time -= 1
        timeLabel.text = formatTimer()
        
        if (time == 0){
            startButton.setTitle("Ok", for: .normal)
            timer.invalidate()
            timeHitzero = true
        }
    }
    
    func formatTimer() -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String (format: "%02i:%02i", minutes, seconds)
    }
}

