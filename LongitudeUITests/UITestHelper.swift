//
//  UITestHelper.swift
//  LongitudeUITests
//
//  Created by Jill Allan on 05/07/2023.
//

import Foundation

struct UITestHelper {
    static func randomDate() -> Date {
        var compontents = DateComponents()
        let calendar = Calendar.current
        
        compontents.year = 1915
        compontents.month = 1
        compontents.day = 1
        
        let startDate = calendar.date(from: compontents) ?? Date.now
        
        let span = TimeInterval.random(in: startDate.timeIntervalSinceNow...Date.now.timeIntervalSinceNow)
        return Date(timeIntervalSinceNow: span)
    }
}
