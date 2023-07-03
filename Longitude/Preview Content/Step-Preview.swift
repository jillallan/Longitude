//
//  Step-Preview.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import CoreLocation
import Foundation
import SwiftData

extension Step {
    
    @MainActor
    static var preview: Step = {
        previews[1]
    }()

    @MainActor
    static var previews: [Step] = {
        let fetchDescriptor = FetchDescriptor<Step>()
        do {
            let steps = try PreviewContainer.preview.mainContext.fetch(fetchDescriptor)
            return steps
        } catch {
            fatalError("Error fetching step in Step Preview: \(error.localizedDescription)")
        }
    }()
    
    static func createSampleData(modelContext: ModelContext) {
        var components = DateComponents()
        let calendar = Calendar.current
        
//        let locations = SampleData.locations
        
        let _ = SampleData.locations.map { (year, month, day, hour, minute, latitude, longitude, placemarkName) in
            components.year = year
            components.month = month
            components.day = day
            components.hour = hour
            components.minute = minute
            
            let date = calendar.date(from: components) ?? Date.now
            
            let step = Step(timestamp: date, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            modelContext.insert(step)
            
            let epsilon = 0.000002

            let fetchDescriptor = FetchDescriptor<Placemark>(predicate: #Predicate { placemark in
                placemark.coordinate.latitude < latitude + epsilon && placemark.coordinate.latitude > latitude - epsilon &&
                placemark.coordinate.longitude < longitude + epsilon && placemark.coordinate.longitude > longitude - epsilon
            })
            do {
                let placemark = try modelContext.fetch(fetchDescriptor).first
                step.placemark = placemark
            } catch {
                fatalError("failed to fetch placemark to assign to Step: \(error.localizedDescription)")
            }
        }
    }
}
