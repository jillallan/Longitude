//
//  Journey-Preview.swift
//  Longitude
//
//  Created by Jill Allan on 17/07/2023.
//

import CoreLocation
import Foundation
import SwiftData

extension Journey {
    // TODO: Update to match step preview
    
    @MainActor
    static var preview: Journey = {
        previews[1]
    }()

    @MainActor
    static var previews: [Journey] = {
        let fetchDescriptor = FetchDescriptor<Journey>()
        do {
            let journeys = try PreviewContainer.preview.mainContext.fetch(fetchDescriptor)
            return journeys
        } catch {
            fatalError("Error fetching journey in Journey Preview: \(error.localizedDescription)")
        }
        
    }()
    
    static func createSampleData(modelContext: ModelContext) {
        var components = DateComponents()
        let calendar = Calendar.current
        
        let _ = SampleData.journeyDetails.map { (year, month, day, hour, minute, hours, minutes) in
            components.year = year
            components.month = month
            components.day = day
            components.hour = hour
            components.minute = minute
            
            let departureDate = calendar.date(from: components) ?? Date.now
            let tempDate = calendar.date(byAdding: .hour, value: hours, to: departureDate) ?? Date.now
            let arrivalDate = calendar.date(byAdding: .minute, value: minutes, to: tempDate) ?? Date.now
            
            let journey = Journey(departureDate: departureDate, arrivalDate: arrivalDate)
            modelContext.insert(journey)

            // fetch step to add to journey based on the date
            let fetchDescriptor = FetchDescriptor<Step>(predicate: #Predicate { step in
                step.timestamp >= departureDate && step.timestamp < arrivalDate
            })
            
            do {
                let steps = try modelContext.fetch(fetchDescriptor)
                _ = steps.map { step in
                    step.journey = journey
                }
            } catch {
                fatalError("failed to fetch steps to assign to Journey: \(error.localizedDescription)")
            }
        }
    }
}
