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
        
        let coordinates = [
            (2016, 7, 28, 8, 6, 51.436027524806505, -2.597474502627349),
            (2016, 7, 28, 8, 27, 51.436027524806505, -2.597474502627349),
            (2016, 7, 28, 8, 35, 51.44951557518499, -2.5805171838600933),
        ]
        
        let _ = coordinates.map { (year, month, day, hour, minute, latitude, longitude) in
            components.year = year
            components.month = month
            components.day = day
            components.hour = hour
            components.minute = minute
            
            let date = calendar.date(from: components) ?? Date.now
            
            let step = Step(timestamp: date, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            
            // TODO: Add placemark
            modelContext.insert(step)
        }
    }
}
