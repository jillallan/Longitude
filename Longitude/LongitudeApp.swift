//
//  LongitudeApp.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftUI
import SwiftData

@main
struct LongitudeApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Trip.self], inMemory: true) { result in
            switch result {
            case .success(let container):
                if ProcessInfo.processInfo.environment["create_sample_data"] != "true" {
                    SamplePersistanceStore.createData(modelContext: container.mainContext)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
