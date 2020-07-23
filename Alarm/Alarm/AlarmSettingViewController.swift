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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        table.delegate = self
        
        sleepTimePicker.locale = Locale.init(identifier: "Japanese")
        
        itemNameArray = ["ミッション", "ミッションの数", "サウンド", "スピーカー","繰り返し", "音量"]
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
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
