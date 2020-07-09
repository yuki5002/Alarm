//
//  AlarmSettingViewController.swift
//  Alarm
//
//  Created by 平石悠生 on 2020/07/09.
//  Copyright © 2020 平石悠生. All rights reserved.
//

import UIKit

class AlarmSettingViewController: UIViewController {
    
    @IBOutlet var sleepTimePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
        sleepTimePicker.setDate(Date(), animated: false)
        sleepTimePicker.locale = Locale.init(identifier: "Japanese")
        
        // Do any additional setup after loading the view.
    }
    func updateDatePicker() {
        //sleepTimePicker.textColor = UIColor.white()
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func alarmBthWasPressed(_ sender: UIButton) {
        
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
