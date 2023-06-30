//
//  Journey.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

@Model
final class Journey {
    
    // MARK: - Properties
    var departureDate: Date
    var arrivalDate: Date
    
    // MARK: - Relationships
    var steps: [Step]? = []
    var activity: Activity?
    
    // MARK: - Computed Properties
    var journeySteps: [Step] {
        steps?.sorted() ?? []
    }
    
    // MARK: - Initialization
    init(departureDate: Date, arrivalDate: Date) {
        self.departureDate = departureDate
        self.arrivalDate = arrivalDate
    }
}
