//
//  File.swift
//  ApiHW
//
//  Created by Виктор Куля on 31.03.2022.
//

import Foundation

extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week
        
        
        
        if secondsAgo < minute {
            return "\(secondsAgo) секунд назад"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute) минут назад"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour) часов назад"
        } else if secondsAgo < week {
            return "\(secondsAgo / day) дней назад"
        } else if secondsAgo < month {
            return "\(secondsAgo / week) недель назад"
        }
        return "\(secondsAgo / month) месяцев назад"
    }
}
