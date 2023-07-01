//
//  Trip-Preview.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

extension Trip {
    // TODO: Update to match step preview
    
    @MainActor
    static var preview: Trip = {
        previews[1]
    }()

    @MainActor
    static var previews: [Trip] = {
        let fetchDescriptor = FetchDescriptor<Trip>()
        do {
            let trips = try PreviewContainer.preview.mainContext.fetch(fetchDescriptor)
            return trips
        } catch {
            fatalError("Error fetching trip in Trip Preview: \(error.localizedDescription)")
        }
        
    }()
    
    static func createSampleData(modelContext: ModelContext) {
        var components = DateComponents()
        let calendar = Calendar.current
        
        let tripDetails = [
            (2016, 7, 28, 4, "Bedminster to Moscow"),
            (2016, 8, 1, 14, "Russia"),
            (2016, 8, 15, 14, "Mongolia")
        ]
        
        let _ = tripDetails.map { (year, month, day, days, title) in
            components.year = year
            components.month = month
            components.day = day
            
            let startDate = calendar.date(from: components) ?? Date.now
            let endDate = calendar.date(byAdding: .day, value: days, to: startDate) ?? Date.now
            
            let step = Trip(startDate: startDate, endDate: endDate, title: title)
            modelContext.insert(step)
        }
    }
}
