//
//  Journey.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

@Model
final class Journey: CustomDebugStringConvertible {
    
    // MARK: - Properties
    var departureDate: Date
    var arrivalDate: Date
    
    // MARK: - Relationships
    var steps: [Step]? = []
    var activity: Activity?
    var departureVisit: Visit?
    var arrivalVisit: Visit?
    
    // MARK: - Computed Properties
    var journeySteps: [Step] {
        var tempSteps: [Step] = []
        
        if let steps {
            tempSteps = steps
        }
        
        if let arrivalVisitStep = arrivalVisit?.step {
            tempSteps.append(arrivalVisitStep)
        }
        
        if let departureVisitStep = departureVisit?.step {
            tempSteps.append(departureVisitStep)
        }
        
        return tempSteps.sorted()
    }
    
    var debugDescription: String {
        "Journey from \(departureDate) to \(arrivalDate)"
    }
    
    // MARK: - Initialization
    init(departureDate: Date, arrivalDate: Date) {
        self.departureDate = departureDate
        self.arrivalDate = arrivalDate
    }
}

// Added comparable comformance to enable sorting by departureDate, for checkSampleStore
extension Journey: Comparable {
    public static func < (lhs: Journey, rhs: Journey) -> Bool {
        lhs.departureDate < rhs.departureDate
    }
}
