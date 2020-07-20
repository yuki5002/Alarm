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
    
    var itemNameArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        table.delegate = self
        
        sleepTimePicker.locale = Locale.init(identifier: "Japanese")
        
        itemNameArray = ["ミッション", "ミッションの数", "サウンド", "スピーカー"]
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
