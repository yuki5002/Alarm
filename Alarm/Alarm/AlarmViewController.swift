//
//  AlarmTableViewController.swift
//  Alarm
//
//  Created by 平石悠生 on 2020/07/19.
//  Copyright © 2020 平石悠生. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    var saveData: UserDefaults = UserDefaults.standard
    var dataArray = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        table.tableFooterView = UIView()
        
        table.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "AlarmTableViewCell")
        
        if saveData.object(forKey: "dataArray") != nil {
            dataArray = saveData.object(forKey: "dataArray") as! [[String]]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        //ここがエラーです
        //let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell") as! AlarmTableViewCell
        
        cell?.textLabel?.text = dataArray[indexPath.row][0]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
