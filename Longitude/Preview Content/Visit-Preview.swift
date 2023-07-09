//
//  Visit-Preview.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import CoreLocation
import Foundation
import SwiftData

extension Visit {
    // TODO: Update to match step preview
    
    @MainActor
    static var preview: Visit = {
        previews[1]
    }()

    @MainActor
    static var previews: [Visit] = {
        let fetchDescriptor = FetchDescriptor<Visit>()
        do {
            let visits = try PreviewContainer.preview.mainContext.fetch(fetchDescriptor)
            return visits
        } catch {
            fatalError("Error fetching visit in Visit Preview: \(error.localizedDescription)")
        }
        
    }()
    
    static func createSampleData(modelContext: ModelContext) {
        var components = DateComponents()
        let calendar = Calendar.current
        
        let _ = SampleData.visitDetails.map { (year, month, day, hour, minute, hours, minutes) in
            components.year = year
            components.month = month
            components.day = day
            components.hour = hour
            components.minute = minute
            
            let arrivalDate = calendar.date(from: components) ?? Date.now
            let tempDate = calendar.date(byAdding: .hour, value: hours, to: arrivalDate) ?? Date.now
            let departureDate = calendar.date(byAdding: .minute, value: minutes, to: tempDate) ?? Date.now
            
            let visit = Visit(arrivalDate: arrivalDate, departureDate: departureDate)
            modelContext.insert(visit)

            // fetch step to add to visit based on the date
            let fetchDescriptor = FetchDescriptor<Step>(predicate: #Predicate { step in
                step.timestamp >= arrivalDate && step.timestamp < departureDate
            })
            
            do {
                let step = try modelContext.fetch(fetchDescriptor).first
                visit.step = step
            } catch {
                fatalError("failed to fetch step to assign to Visit: \(error.localizedDescription)")
            }
        }
    }
}
