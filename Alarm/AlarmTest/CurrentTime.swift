//
//  CurrentTime.swift
//  Alarm
//
//  Created by 平石悠生 on 2020/07/10.
//  Copyright © 2020 平石悠生. All rights reserved.
//

import Foundation

class CurrentTime {

    var timer: Timer?
    var currentTime: String?
    var df = DateFormatter()
    weak var delegate: SleepingViewController?

    init() {
        if timer == nil{
            //タイマーをセット、一秒ごとにupdateCurrentTimeを呼ぶ
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
        }
    }

    @objc private func updateCurrentTime(){
        //フォーマットの指定
        df.dateFormat = "HH:mm"
        //時刻をUNIXから端末のタイムゾーンにする
        df.timeZone = TimeZone.current
        //現在の時間をフォーマットに従って文字列化を行う
        let timezoneDate = df.string(from: Date())
        currentTime = timezoneDate
        delegate?.updateTime(currentTime!)
    }
    
}
