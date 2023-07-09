//
//  Activity-Preview.swift
//  Longitude
//
//  Created by Jill Allan on 04/07/2023.
//

import Foundation
import SwiftData

extension Activity {
    
    @MainActor
    static var preview: Activity = {
        previews[1]
    }()

    @MainActor
    static var previews: [Activity] = {
        let fetchDescriptor = FetchDescriptor<Activity>()
        do {
            let activities = try PreviewContainer.preview.mainContext.fetch(fetchDescriptor)
            return activities
        } catch {
            fatalError("Error fetching activities in Activity Preview: \(error.localizedDescription)")
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
            
            let date = calendar.date(from: components) ?? Date.now
            
            let activity = Activity(timestamp: date)
            modelContext.insert(activity)

            // fetch activity to add to visit
            let fetchDescriptor = FetchDescriptor<Visit>(predicate: #Predicate { visit in
                visit.arrivalDate == date
            })
            
            do {
                let visit = try modelContext.fetch(fetchDescriptor).first
                activity.visit = visit
            } catch {
                fatalError("failed to fetch step to assign to Visit: \(error.localizedDescription)")
            }
        }
    }
}
