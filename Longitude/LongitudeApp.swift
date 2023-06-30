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
        .modelContainer(for: Trip.self)
    }
}
