//
//  Visit.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

@Model
final class Visit {
    
    // MARK: - Properties
    var arrivalDate: Date
    var departureDate: Date
    
    // MARK: - Relationships
    var steps: Step?
    // TODO: Add trip relationship
    
    init(arrivalDate: Date, departureDate: Date) {
        self.arrivalDate = arrivalDate
        self.departureDate = departureDate
    }
}
