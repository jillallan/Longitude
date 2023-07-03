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
        
        let visitDetails = [
            (2016, 7, 27, 9, 0, 0, 1, 51.436027524806505, -2.597474502627349, "St Johns Lane"),
            (2016, 7, 27, 9, 45, 0, 30, 51.436027524806505, -2.597474502627349, "Bedminster Station"),
            (2016, 7, 27, 10, 30, 0, 30, 51.436027524806505, -2.597474502627349, "Temple Meads")
        ]
        
        let _ = visitDetails.map { (year, month, day, hour, minute, hours, minutes, latitude, longitude, title) in
            components.year = year
            components.month = month
            components.day = day
            
            let startDate = calendar.date(from: components) ?? Date.now
            let tempDate = calendar.date(byAdding: .hour, value: hours, to: startDate) ?? Date.now
            let endDate = calendar.date(byAdding: .minute, value: minutes, to: tempDate) ?? Date.now
            
            let epsilon = 0.000002

            let fetchDescriptor = FetchDescriptor<Step>(predicate: #Predicate { step in
                step.coordinate.latitude < latitude + epsilon && step.coordinate.latitude > latitude - epsilon &&
                step.coordinate.longitude < longitude + epsilon && step.coordinate.longitude > longitude - epsilon
            })
            do {
                let step = try modelContext.fetch(fetchDescriptor).first
                let visit = Visit(arrivalDate: startDate, departureDate: endDate)
                modelContext.insert(visit)
                visit.step = step
            } catch {
                fatalError("failed to fetch step to assign to Visit: \(error.localizedDescription)")
            }
            
//            let step = Step(timestamp: startDate, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
//            modelContext.insert(step)
            
            
        }
    }
}
