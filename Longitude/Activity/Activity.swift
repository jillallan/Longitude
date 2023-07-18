//
//  Activity.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

@Model
final class Activity {
    
    // MARK: - Properties
//    var start
    var timestamp: Date
    
    // MARK: - Relationships
    var visit: Visit?
    var journey: Journey?
    var trip: Trip?
    
    // MARK: - Initialization
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

extension Activity: Comparable {
    static func < (lhs: Activity, rhs: Activity) -> Bool {
        lhs.timestamp < rhs.timestamp
    }
}
