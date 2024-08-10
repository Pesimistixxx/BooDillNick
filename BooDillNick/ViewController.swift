//
//  ViewController.swift
//  BooDillNick
//
//  Created by Компьютер on 29.07.2024.
//

import UIKit

protocol VCDelegate{
    func changeTime(hour: Int, minute : Int)
    func changeDescription(description : String)
}

class ViewController: UIViewController, UIScrollViewDelegate{
    var alarmClock1Enabled = false
    var alarmClock1Hour = 7
    var alarmClock1Minute = 0
    
    @IBOutlet var alarmClock1Description: UILabel!
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
    override func prepare(for segue : UIStoryboardSegue, sender : Any?){
        if segue.identifier == "changeTime", let vc = segue.destination as?TimeViewController{
            vc.descriptionchange = alarmClock1Description.text!
            print(alarmClock1Hour)
            vc.dateHour = alarmClock1Hour
            vc.dateMinute = alarmClock1Minute
            vc.delegate = self
        }
    }
    @IBAction func ChangeTime(_ sender: Any?) {
        performSegue(withIdentifier: "changeTime", sender: self)
        print("!!!")
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
        AlarmClock1Hour.image = UIImage(named: String(alarmClock1Hour))
        AlarmClock1Minute.image = UIImage(named: String(alarmClock1Minute))
        super.viewDidLoad()
        updateUI()
    }
}

extension ViewController : VCDelegate{
    func changeTime(hour: Int, minute: Int) {
        AlarmClock1Minute.image = UIImage(named: String(minute))
        AlarmClock1Hour.image = UIImage(named: String(hour))
        alarmClock1Hour = hour
        alarmClock1Minute = minute
    }
    func changeDescription(description : String){
        alarmClock1Description.text = description
    }
}
