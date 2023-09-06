//
//  Activity.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

@Model
final class Activity: CustomDebugStringConvertible {
    
    // MARK: - Properties
//    var start
    var timestamp: Date
    
    // MARK: - Relationships
    var visit: Visit?
    var journey: Journey?
    var trip: Trip?
    
    // MARK: - Computed Properties
    var steps: [Step] {
        var steps: [Step] = []
        
        if let step = visit?.step {
            steps.append(step)
        }
        
        if let journeySteps = journey?.journeySteps {
            steps.append(contentsOf: journeySteps)
        }
        
        return steps
    }
    
    var activityEndDate: Date {
        var date = Date.now
        
        if let visit {
            date = visit.departureDate
        }
        
        if let journey {
            date = journey.arrivalDate
        }
        
        return date
    }
    
    enum type {
        case visit
        case journey
        case empty
    }
    
    var activityType: type {
        if visit != nil {
            return type.visit
        }
        if journey != nil {
            return type.journey
        }
        return type.empty
    }
    
    var debugDescription: String {
        if activityType == .visit {
            return "Visit at \(timestamp)"
        }
        if activityType == .journey {
            return "Journey at \(timestamp)"
        }
        return "No activity at \(timestamp)"

    }
    
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
