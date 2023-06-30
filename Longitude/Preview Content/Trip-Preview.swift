//
//  Trip-Preview.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

extension Trip {
    
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
    
    static func createSampleData(modelContext: ModelContext) -> [Trip] {
        var components = DateComponents()
        let calendar = Calendar.current
        components.year = 2016
        components.month = 7
        components.day = 27
        
        let trip1startDate = calendar.date(from: components) ?? Date.now
        let trip1endDate = calendar.date(byAdding: .day, value: 4, to: trip1startDate) ?? Date.now
        
        let trip2startDate = calendar.date(byAdding: .day, value: 4, to: trip1startDate) ?? Date.now
        let trip2endDate = calendar.date(byAdding: .day, value: 20, to: trip1startDate) ?? Date.now
        
        let trip3startDate = calendar.date(byAdding: .day, value: 20, to: trip1startDate) ?? Date.now
        let trip3endDate = calendar.date(byAdding: .day, value: 34, to: trip1startDate) ?? Date.now
        
        let trips = [
            Trip(startDate: trip1startDate, endDate: trip1endDate, title: "Bedminster to Moscow"),
            Trip(startDate: trip2startDate, endDate: trip2endDate, title: "Russia"),
            Trip(startDate: trip3startDate, endDate: trip3endDate, title: "Mongolia")
        ]
        
        _ = trips.map { trip in
            modelContext.insert(trip)
        }
        
        return trips
    }
}
