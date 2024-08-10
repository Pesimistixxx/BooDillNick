//
//  TimeViewController.swift
//  BooDillNick
//
//  Created by Компьютер on 06.08.2024.
//

import UIKit
import Foundation

class TimeViewController: UIViewController , UITextFieldDelegate{
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func goBackAndSave(_ sender: UIButton) {
        self.dismiss(animated: true)
        delegate.changeTime(hour: Int(localizedDateString.dropFirst(11).dropLast(6))!, minute: Int(localizedDateString.dropFirst(14).dropLast(3))!)
        delegate.changeDescription(description: textField.text! ?? "")
    }

    
    @IBAction func timePickerUpdate(_ sender: UIDatePicker) {
        utcDate = TimePicker.date
        localizedDateString = dateFormatter.string(from: utcDate)
    }
    @IBOutlet var TimePicker: UIDatePicker!{
        didSet{
            TimePicker.setValue(UIColor.white, forKeyPath: "textColor")
            TimePicker.setValue(false, forKeyPath: "highlightsToday")
            let targetDate = DateComponents(hour: dateHour,minute: dateMinute)
            let calendar = Calendar.current
            if let date = calendar.date(from: targetDate) {
                TimePicker.date = date
            }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let utcDate = TimePicker.date
            let myCalendar = Calendar.current
            let tz = myCalendar.dateComponents([.timeZone], from: Date()).description.dropLast(10)
            let targetTimeZone = TimeZone(identifier: String(tz))
            dateFormatter.timeZone = targetTimeZone
            localizedDateString = dateFormatter.string(from: utcDate)
            print(localizedDateString)
        }
    }
    var delegate : VCDelegate!
    @IBOutlet var textField: UITextField!{
        didSet{
            textField.textColor = UIColor.white
        }
    }
    var utcDate : Date!
    var dateFormatter: DateFormatter!
    var myCalendar: Calendar!
    var localizedDateString = ""
    var tz: String.SubSequence!
    var targetTimeZone: TimeZone?
    var hourValue = 1
    var minuteValue = 1
    var dateHour = 0
    var dateMinute = 0
    var descriptionchange = ""
    @IBAction func startEdit(_ sender: Any) {
        if textField.text == "Description"{
            textField.text = ""
        }
        else if textField.text == "ALARM CLOCK"{
            textField.text = ""
        }
    }
    
    @IBAction func textEdit(_ sender: UITextField) {
        if textField.text!.count >= 50{
            textField.text = String(textField.text!.prefix(50))
        }
    }
    override func viewDidLoad() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        utcDate = TimePicker.date
        myCalendar = Calendar.current
        tz = myCalendar.dateComponents([.timeZone], from: Date()).description.dropLast(10)
        targetTimeZone = TimeZone(identifier: String(tz))
        dateFormatter.timeZone = targetTimeZone
        textField.delegate = self
        textField.text = descriptionchange
        super.viewDidLoad()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
