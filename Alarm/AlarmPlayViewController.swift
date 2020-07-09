//
//  AlarmPlayViewController.swift
//  Alarm
//
//  Created by 平石悠生 on 2020/07/09.
//  Copyright © 2020 平石悠生. All rights reserved.
//

import UIKit

class AlarmPlayViewController: UIViewController {
    
    var currentTime = CurrentTime()
    
    @IBOutlet var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBthWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
