//
//  Date-Extension.swift
//  Longitude
//
//  Created by Jill Allan on 05/07/2023.
//

// https://gist.github.com/nbasham/c219d8c8c773d2c146c526dfccb4353b

import Foundation

extension Date {
    static func random(in range: ClosedRange<Date>) -> Date {
        let span = TimeInterval.random(
            in: range.lowerBound.timeIntervalSinceNow...range.upperBound.timeIntervalSinceNow
        )
        return Date(timeIntervalSinceNow: span)
    }
}
