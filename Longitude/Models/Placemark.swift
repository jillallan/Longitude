//
//  Placemark.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import CoreLocation
import Foundation
import SwiftData

@Model
final class Placemark {
    
    // MARK: - Properties
    var coordinate: CLLocationCoordinate2D
    var name: String
    var subThoroughfare: String?
    var thoroughfare: String?
    var subAdministrativeArea: String?
    var administrativeArea: String?
    var subLocality: String?
    var locality: String?
    var postalCode: String?
    var country: String?
    var isoCountryCode: String?
    var inlandWater: String?
    var ocean: String?
    var areaOfInterest: String?
    var createdDate: Date
    
    // MARK: - Relationships
    var steps: [Step]? = []

    // MARK: - Initialization
    init(coordinate: CLLocationCoordinate2D, name: String, subThoroughfare: String? = nil, thoroughfare: String? = nil, subAdministrativeArea: String? = nil, administrativeArea: String? = nil, subLocality: String? = nil, locality: String? = nil, postalCode: String? = nil, country: String? = nil, isoCountryCode: String? = nil, inlandWater: String? = nil, ocean: String? = nil, areaOfInterest: String? = nil, createdDate: Date, steps: [Step]? = nil) {
        self.coordinate = coordinate
        self.name = name
        self.subThoroughfare = subThoroughfare
        self.thoroughfare = thoroughfare
        self.subAdministrativeArea = subAdministrativeArea
        self.administrativeArea = administrativeArea
        self.subLocality = subLocality
        self.locality = locality
        self.postalCode = postalCode
        self.country = country
        self.isoCountryCode = isoCountryCode
        self.inlandWater = inlandWater
        self.ocean = ocean
        self.areaOfInterest = areaOfInterest
        self.createdDate = createdDate
        self.steps = steps
    }
}
