//
//  Placemark-Preview.swift
//  Longitude
//
//  Created by Jill Allan on 03/07/2023.
//

import CoreLocation
import Foundation
import SwiftData

extension Placemark {
    @MainActor
    static var preview: Placemark = {
        previews[1]
    }()

    @MainActor
    static var previews: [Placemark] = {
        let fetchDescriptor = FetchDescriptor<Placemark>()
        do {
            let placemarks = try PreviewContainer.preview.mainContext.fetch(fetchDescriptor)
            return placemarks
        } catch {
            fatalError("Error fetching placemark in Placemark Preview: \(error.localizedDescription)")
        }
    }()
    
    static func createSampleData(modelContext: ModelContext) {

        let _ = SampleData.locations.map { (year, month, day, hour, minute, latitude, longitude, placemarkName) in
            
            let placemark = Placemark(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), name: placemarkName, createdDate: Date.now)
            modelContext.insert(placemark)
        }
    }
}
