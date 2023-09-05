//
//  Trip.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

@Model
final class Trip: CustomDebugStringConvertible {
    
    
    // MARK: - Properties
    var tripID = UUID()
    var startDate: Date
    var endDate: Date
    var title: String
    
    // MARK: - Relationships
    var activities: [Activity]? = []
    
    // MARK: - Computed Properties
    var tripActivities: [Activity] {
        activities?.sorted() ?? []
    }
    
    var debugDescription: String {
        "Trip named: \(title)"
    }
    
    var steps: [Step] {
        var steps: [Step] = []
        
        _ = tripActivities.map { activity in
            if let step = activity.visit?.step {
                steps.append(step)
            }
            
            if let journeySteps = activity.journey?.steps {
                steps.append(contentsOf: journeySteps)
            }
        }
        
        return steps.sorted()
    }
    
    var startDateString: String {
        startDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    var endDateString: String {
        endDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    init(startDate: Date, endDate: Date, title: String) {
        self.startDate = startDate
        self.endDate = endDate
        self.title = title
    }
}
