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
    var step: Step?
    var activity: Activity?
    
    // MARK: - Computed Properties
    // TODO: Add stringArrivalDate and stringDepartureDate
    // TODO: Add length of visit
    
    init(arrivalDate: Date, departureDate: Date) {
        self.arrivalDate = arrivalDate
        self.departureDate = departureDate
    }
}

// Added comparable comformance to enable sorting by arrivalDate
//extension Visit: Comparable {
//    public static func < (lhs: Visit, rhs: Visit) -> Bool {
//        lhs.arrivalDate < rhs.arrivalDate
//    }
//}
