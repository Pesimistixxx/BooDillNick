//
//  TimeViewController.swift
//  BooDillNick
//
//  Created by Компьютер on 06.08.2024.
//

import UIKit

class TimeViewController: UIViewController , UITextFieldDelegate{
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func goBackAndSave(_ sender: UIButton) {
        self.dismiss(animated: true)
        delegate.changeTime(hour: Int(TimePicker.date.description.dropFirst(11).dropLast(12))! + 3, minute: Int(TimePicker.date.description.dropFirst(14).dropLast(9))!)
        delegate.changeDescription(description: textField.text! ?? "")
    }
    @IBOutlet var TimePicker: UIDatePicker!{
        didSet{
            var a = self.TimePicker.date.description.dropFirst(11).dropLast(12)
            //print(a)
        }
    }
    var delegate : VCDelegate!
    @IBOutlet var textField: UITextField!{
        didSet{
            textField.textColor = UIColor.white
        }
    }
    var hourValue = 1
    var minuteValue = 1
    var po = 1
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
            //print("TEX")
            textField.text = String(textField.text!.prefix(50))
        }
    }
    override func viewDidLoad() {
        TimePicker.setValue(UIColor.white, forKeyPath: "textColor")
        TimePicker.setValue(false, forKeyPath: "highlightsToday")
        textField.delegate = self
        textField.text = descriptionchange
        //let a = TimePicker.datefrom
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
