//
//  ViewController.swift
//  BooDillNick
//
//  Created by Компьютер on 29.07.2024.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{
    var alarmClock1Enabled = false
    var alarmClock1Hour = 18
    var alarmClock1Minute = 52
    @IBOutlet var AlarmClock1Minute: UIImageView!
    @IBOutlet var AlarmClock1Hour: UIImageView!
    @IBOutlet var SwitchAlarm1: UISwitch!
    @IBOutlet var ViewAll: UIView!
    @IBOutlet var HourImage: UIImageView!
    @IBOutlet var MinuteImage: UIImageView!
    @IBOutlet var SecondImage: UIImageView!
    @IBAction func SwitchAlarm1Changed(_ sender: UISwitch) {
        alarmClock1Enabled = true
        
    }
    func updateUI(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            (_) in
            let currentHour = (Calendar.current.component(.hour, from: Date()))
            let currentMinute = (Calendar.current.component(.minute, from: Date()))
            let currentSecond = (Calendar.current.component(.second, from: Date()))
            self.HourImage.image = UIImage(named: String(currentHour))
            self.MinuteImage.image = UIImage(named: String(currentMinute))
            self.SecondImage.image = UIImage(named: String(currentSecond))
            if self.alarmClock1Enabled == true{
                if currentHour == self.alarmClock1Hour && currentMinute == self.alarmClock1Minute && currentSecond  == 0{
                    print("ALARM!")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
}

