//
//  TimerSettingViewController.swift
//  Alarm
//
//  Created by 平石悠生 on 2020/07/20.
//  Copyright © 2020 平石悠生. All rights reserved.
//

import UIKit

class TimerSettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var sleepTimePicker: UIDatePicker!
    @IBOutlet var startbutton: UIButton!
    @IBOutlet var resetbutton: UIButton!
    @IBOutlet var label: UILabel!
    
    var itemNameArray = [String]()
    var saveData: UserDefaults = UserDefaults.standard
    
    var timer: Timer = Timer()
    var selectedTimeHStr: String = ""
    var selectedTimeMStr: String = ""
    var selectedTimeHInt: Int = 0
    var selectedTimeMInt: Int = 0
    var count: Int = 0
    var countMemo: Int = 0
    var second: Int = 0
    var minute: Int = 0
    var hour: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        sleepTimePicker.locale = Locale.init(identifier: "Japanese")
        
        itemNameArray = ["ミッション", "ミッションの数", "サウンド", "スピーカー"]
        
        startbutton.layer.borderWidth = 2.0
        startbutton.layer.borderColor = UIColor.green.cgColor
        
        resetbutton.layer.borderWidth = 2.0
        resetbutton.layer.borderColor = UIColor.red.cgColor
        
        count = 60
        if saveData.object(forKey: "count") != nil {
            count = saveData.object(forKey: "count") as! Int
            sleepTimePicker.countDownDuration = TimeInterval(saveData.object(forKey: "count") as! Int)
        }
        
        label.isHidden = true
    }
    
    func labelController() {
        second = count % 60
        minute = count / 60
        hour = minute / 60
        minute = minute - (hour * 60)
        if hour != 0 {
            if minute < 10 && second < 10 {
                label.text = String(hour) + ":0" + String(minute) + ":0" + String(second)
            }else if minute < 10 {
                label.text = String(hour) + ":0" + String(minute) + ":" + String(second)
            }else if second < 10 {
                label.text = String(hour) + ":" + String(minute) + ":0" + String(second)
            }else {
                label.text = String(hour) + ":" + String(minute) + ":" + String(second)
            }
        }else {
            if minute < 10 && second < 10 {
                label.text = "0" + String(minute) + ":0" + String(second)
            }else if minute < 10 {
                label.text = "0" + String(minute) + ":" + String(second)
            }else if second < 10 {
                label.text = String(minute) + ":0" + String(second)
            }else {
                label.text = String(minute) + ":" + String(second)
            }
        }
    }
    
    @objc func down() {
        if count > 0 {
            count = count - 1
            labelController()
        }else {
            timer.invalidate()
            startbutton.setTitle("スタート", for: .normal)
            sleepTimePicker.isHidden = false
            label.isHidden = true
            table.isHidden = false
            count = countMemo
            saveData.set(count, forKey: "count")
            performSegue(withIdentifier: "toTimerPlay", sender: nil)
        }
    }
    
    @IBAction func start() {
        print(count)
        if !timer.isValid && count > 0 {
            labelController()
            timer = Timer.scheduledTimer(timeInterval: 1,
                                             target: self,
                                             selector: #selector(self.down),
                                             userInfo: nil,
                                             repeats: true)
            startbutton.setTitle("ストップ", for: .normal)
            sleepTimePicker.isHidden = true
            label.isHidden = false
            table.isHidden = true
        } else if timer.isValid {
            timer.invalidate()
            startbutton.setTitle("スタート", for: .normal)
        }
    }
    @IBAction func reset() {
        timer.invalidate()
        startbutton.setTitle("スタート", for: .normal)
        sleepTimePicker.isHidden = false
        label.isHidden = true
        table.isHidden = false
        count = countMemo
        saveData.set(count, forKey: "count")
    }
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatterH = DateFormatter()
        dateFormatterH.dateFormat = "HH"
        let dateFormatterM = DateFormatter()
        dateFormatterM.dateFormat = "mm"
        selectedTimeHStr = dateFormatterH.string(from: sender.date)
        selectedTimeMStr = dateFormatterM.string(from: sender.date)
        selectedTimeHInt = Int(selectedTimeHStr)!
        selectedTimeMInt = Int(selectedTimeMStr)!
        count = selectedTimeHInt * 3600 + selectedTimeMInt * 60
        print(count)
        countMemo = count
    }
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
        return itemNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = itemNameArray[indexPath.row]
        
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
