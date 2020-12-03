//
//  TimerPlayViewController.swift
//  Alarm
//
//  Created by 平石悠生 on 2020/11/19.
//  Copyright © 2020 平石悠生. All rights reserved.
//

import UIKit
import AVFoundation


class TimerPlayViewController: UIViewController {

    var nowTime: String!
    @IBOutlet var timeLabel: UILabel!
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //現在の時間表示
        let now = Date()
        print(now)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        nowTime = dateFormatter.string(from: now)
        timeLabel.text = String(nowTime)
        
        //通知
        let content = UNMutableNotificationContent()
                content.title = "タイマー"
                content.sound = UNNotificationSound.default
                // 直ぐに通知を表示
                let request = UNNotificationRequest(identifier: "immediately", content: content, trigger: nil)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        //音を鳴らす
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: "starmarker", ofType: "mp3")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer.play()
    }
    
    @IBAction func back() {
        audioPlayer.stop()
        dismiss(animated: true, completion: nil)
    }

}
