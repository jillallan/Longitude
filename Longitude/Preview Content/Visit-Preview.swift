//
//  Visit-Preview.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

extension Visit {
    // TODO: Update to match step preview
    
    static func createSampleData(modelContext: ModelContext) -> [Visit] {
        var components = DateComponents()
        let calendar = Calendar.current
        components.year = 2016
        components.month = 7
        components.day = 27
        components.hour = 8
        components.minute = 0
        
        let visit1ArrivalDate = calendar.date(from: components) ?? Date.now
        let visit2ArrivalDate = calendar.date(from: components) ?? Date.now
        
        let visits = [
            Visit(
                arrivalDate: visit1ArrivalDate,
                departureDate: calendar.date(byAdding: .hour, value: 1, to: visit1ArrivalDate) ?? Date.now
            ),
            Visit(
                arrivalDate: visit1ArrivalDate,
                departureDate: calendar.date(byAdding: .hour, value: 1, to: visit1ArrivalDate) ?? Date.now
            ),
        ]
        
        return visits
    }
}
