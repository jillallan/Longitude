//
//  Step.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import CoreLocation
import Foundation
import SwiftData

@Model
final class Step {

    // MARK: - Properties
    var timestamp: Date
    var coordinate: CLLocationCoordinate2D
    var altitude: Double = 0.0
    var horizontalAccuracy: Double = 0.0
    var verticalAccuracy: Double = 0.0
    var day: Date
    
    // MARK: - Relationships
    var placemark: Placemark?
    var journey: Journey?
    var visit: Visit?
    
    // MARK: - Computed Properties
    var title: String {
//        timestamp.formatted(date: .abbreviated, time: .shortened)
        timestamp.formatted(Date.FormatStyle().month(.wide))
    }
    
    var placemarkName: String {
        placemark?.name ?? "Unknown Place"
    }
    
    // MARK: - Initialization
    init(timestamp: Date, coordinate: CLLocationCoordinate2D, altitude: Double, horizontalAccuracy: Double, verticalAccuracy: Double, day: Date) {
        self.timestamp = timestamp
        self.coordinate = coordinate
        self.altitude = altitude
        self.horizontalAccuracy = horizontalAccuracy
        self.verticalAccuracy = verticalAccuracy
        
        self.day = Calendar.current.startOfDay(for: timestamp)
    }
    
    convenience init(timestamp: Date, coordinate: CLLocationCoordinate2D) {
        self.init(
            timestamp: timestamp,
            coordinate: coordinate,
            altitude: 0.0,
            horizontalAccuracy: 0.0,
            verticalAccuracy: 0.0,
            day: Calendar.current.startOfDay(for: timestamp)
        )
    }
}

// Added comparable comformance to enable sorting by timestamp
extension Step: Comparable {
    public static func < (lhs: Step, rhs: Step) -> Bool {
        lhs.timestamp < rhs.timestamp
    }
}
