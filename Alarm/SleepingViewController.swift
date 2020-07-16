//
//  AlarmPlayViewController.swift
//  Alarm
//
//  Created by 平石悠生 on 2020/07/10.
//  Copyright © 2020 平石悠生. All rights reserved.
//

import UIKit

class SleepingViewController: UIViewController {

    var currentTime = CurrentTime()
    
    @IBOutlet var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentTime.delegate = self
    }
    
    @IBAction func closeBthWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateTime(_ time:String) {
        timeLabel.text = time
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
