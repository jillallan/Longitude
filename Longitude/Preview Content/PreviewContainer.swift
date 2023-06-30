//
//  PreviewContainer.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

@MainActor
struct PreviewContainer {
    
    static var preview: ModelContainer = {
        do {
            let container = try ModelContainer(
                for: [Step.self, Trip.self],
                ModelConfiguration(inMemory: true)
            )
            
            SampleData.createData(modelContext: container.mainContext)

            return container
            
        } catch {
            fatalError("error loading sample data: \(error.localizedDescription)")
        }
    }()
}
