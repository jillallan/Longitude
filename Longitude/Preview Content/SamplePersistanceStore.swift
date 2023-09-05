//
//  SampleData.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import OSLog
import SwiftData

struct SamplePersistanceStore {
    
    @MainActor
    static func createData(modelContext: ModelContext) {
        Placemark.createSampleData(modelContext: modelContext)
        Step.createSampleData(modelContext: modelContext)
        Visit.createSampleData(modelContext: modelContext)
        Journey.createSampleData(modelContext: modelContext)
        Activity.createSampleData(modelContext: modelContext)
        Trip.createSampleData(modelContext: modelContext)
        
        _ = Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: Self.self))
    
    }
}
