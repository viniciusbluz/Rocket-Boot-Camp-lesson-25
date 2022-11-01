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
        timeLabel.text = textTimeSelected
    }
    var timer = Timer()
    var isTimerStarted = false
    var time = 1500
    var textTimeSelected = "25:00"
    var timeSelected = 1500
    var timeHitzero: Bool = false
    
    @IBAction func segmentControlOption(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            textTimeSelected = "25:00"
            timeSelected = 1500
            resetTimer()
        case 1:
            textTimeSelected = "5:00"
            timeSelected = 3
            resetTimer()
        case 2:
            textTimeSelected = "15:00"
            timeSelected = 900
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
        time = timeSelected
        isTimerStarted = false
        timeLabel.text = textTimeSelected
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

