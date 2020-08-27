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
    @IBOutlet var label: UILabel!
    
    var itemNameArray = [String]()
    
    
    var timer: Timer = Timer()
    var selectedTimeHStr: String = ""
    var selectedTimeMStr: String = ""
    var selectedTimeHInt: Int = 0
    var selectedTimeMInt: Int = 0
    var count: Int = 0
    var secound: Int = 0
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
        
        let now = Date()
        let dateFormatterM = DateFormatter()
        dateFormatterM.dateFormat = "mm"
        let dateFormatterS = DateFormatter()
        dateFormatterS.dateFormat = "ss"
        selectedTimeHStr = dateFormatterM.string(from: now)
        selectedTimeMStr = dateFormatterS.string(from: now)
        selectedTimeHInt = Int(selectedTimeHStr)!
        selectedTimeMInt = Int(selectedTimeMStr)!
        count = selectedTimeHInt * 60 + selectedTimeMInt
        label.isHidden = true
    }
    
    @objc func down() {
        count = count - 1
        secound = count % 60
        minute = count / 60
        hour = minute / 60
        minute = minute - (hour * 60)
        label.text = String(hour) + " : " + String(minute) + " : " + String(secound)
    }
    
    @IBAction func start() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1,
                                             target: self,
                                             selector: #selector(self.down),
                                             userInfo: nil,
                                             repeats: true)
            startbutton.setTitle("ストップ", for: .normal)
            sleepTimePicker.isHidden = true
            label.isHidden = false
        } else if timer.isValid {
            timer.invalidate()
            startbutton.setTitle("スタート", for: .normal)
            sleepTimePicker.isHidden = false
            label.isHidden = true
        }
    }
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatterM = DateFormatter()
        dateFormatterM.dateFormat = "HH"
        let dateFormatterS = DateFormatter()
        dateFormatterS.dateFormat = "mm"
        selectedTimeHStr = dateFormatterM.string(from: sender.date)
        selectedTimeMStr = dateFormatterS.string(from: sender.date)
        selectedTimeHInt = Int(selectedTimeHStr)!
        selectedTimeMInt = Int(selectedTimeMStr)!
        count = selectedTimeHInt * 3600 + selectedTimeMInt * 60
        print(count)
        print("secound : " + String(count % 60))
        print("minute : " + String(count / 60))
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
