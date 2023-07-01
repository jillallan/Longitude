//
//  SampleData.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

struct SampleData {
    @MainActor
    static func createData(modelContext: ModelContext) {
//        let trips = Trip.createSampleData(modelContext: modelContext)
        Trip.createSampleData(modelContext: modelContext)
    }
}
