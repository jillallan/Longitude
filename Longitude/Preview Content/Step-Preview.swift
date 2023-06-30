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
            (2016, 7, 27, 9, 0, 21.00, 0.00),
            (2016, 7, 27, 9, 10, 28.00, 0.55)
        ]
        
        let _ = coordinates.map { (year, month, day, hour, minute, latitude, longitude) in
            components.year = year
            components.month = month
            components.day = day
            components.hour = hour
            components.minute = minute
            
            let date = calendar.date(from: components) ?? Date.now
            
            let step = Step(timestamp: date, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            modelContext.insert(step)
        }
    }
}
