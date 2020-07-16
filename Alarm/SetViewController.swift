//
//  AlarmSettingViewController.swift
//  Alarm
//
//  Created by 平石悠生 on 2020/07/09.
//  Copyright © 2020 平石悠生. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {
    
    let alarm = Alarm()
    
    @IBOutlet var sleepTimePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sleepTimePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
//        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
        sleepTimePicker.setDate(Date(), animated: false)
        sleepTimePicker.locale = Locale.init(identifier: "Japanese")
        
        //AlarmでsleepTimerがnilじゃない場合
        if alarm.sleepTimer != nil{
            //再生されているタイマーを止める
            alarm.stopTimer()
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func alarmBthWasPressed(_ sender: UIButton) {
        //AlarmにあるselectedWakeUpTimeにユーザーの入力した日付を代入
        alarm.selectedWakeUpTime = sleepTimePicker.date
        //AlarmのrunTimerを呼ぶ
        alarm.runTimer()
        //SleepingViewControllerへの画面移動
        performSegue(withIdentifier: "setToSleeping", sender: nil)
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
