//
//  Trip.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

@Model
final class Trip {
    
    // MARK: - Properties
    var startDate: Date
    var endDate: Date
    var title: String
    
    // MARK: - Relationships
    var activities: [Activity]? = []
    
    // MARK: - Computed Properties
    var tripActivities: [Activity] {
        activities?.sorted() ?? []
    }
    
    init(startDate: Date, endDate: Date, title: String) {
        self.startDate = startDate
        self.endDate = endDate
        self.title = title
    }
}
