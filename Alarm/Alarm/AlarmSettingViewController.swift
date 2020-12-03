//
//  AlarmSettingTableViewController.swift
//  Alarm
//
//  Created by 平石悠生 on 2020/07/19.
//  Copyright © 2020 平石悠生. All rights reserved.
//

import UIKit

class AlarmSettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var sleepTimePicker: UIDatePicker!
    var itemNameArray = [String]()
    
    var saveData: UserDefaults = UserDefaults.standard
    var id: Int = 0
    var dataArray = [[Any]]()
    var addArray = [Any]()
    var selectedTimeStr: String = ""
    var mission: Int = 0
    var missionNum: Int = 0
    var sound: Int = 0
    var speaker: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        sleepTimePicker.locale = Locale.init(identifier: "Japanese")
        itemNameArray = ["ミッション", "ミッションの数", "サウンド", "スピーカー","繰り返し"]
        table.tableFooterView = UIView()
        if #available(iOS 13.4, *) {
            sleepTimePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        
        let now = Date()
        print(now)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        selectedTimeStr = dateFormatter.string(from: now)
        print(selectedTimeStr)
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    //データの保存
    @IBAction func save() {
        if saveData.object(forKey: "idNum") == nil {
            id = 0
            saveData.set(id, forKey: "idNum")
        }else {
            id = saveData.object(forKey: "idNum") as! Int + 1
            saveData.set(id, forKey: "idNum")
        }
        saveData.set(mission, forKey: "mission" + String(id))
        saveData.set(missionNum, forKey: "missionNum" + String(id)) 
        saveData.set(sound, forKey: "sound" + String(id))
        saveData.set(speaker, forKey: "speaker" + String(id))
        
        dataArray = saveData.object(forKey: "dataArray") as! [[Any]]
        addArray = [selectedTimeStr, String(id)]
        dataArray.append(addArray)
        print("appendの直後のDataArray")
        print(dataArray)
        saveData.set(dataArray, forKey: "dataArray")
        print("AddArray")
        print(addArray)
        print("DataArray")
        print(dataArray)
        print(String(mission) + String(missionNum) + String(sound) + String(speaker))
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        selectedTimeStr = dateFormatter.string(from: sender.date)
        print(selectedTimeStr)
    }
    
    
    
    
    
    
    
    //cellの内容
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "toMission", sender: nil)
        }
        if indexPath.row == 1 {
            performSegue(withIdentifier: "toNumber", sender: nil)
        }
        if indexPath.row == 2 {
            performSegue(withIdentifier: "toSound", sender: nil)
        }
        if indexPath.row == 3 {
            performSegue(withIdentifier: "toSpeaker", sender: nil)
        }
        if indexPath.row == 4 {
            performSegue(withIdentifier: "toKurikaeshi", sender: nil)
        }
    }

}
