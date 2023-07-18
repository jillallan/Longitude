//
//  ContentView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        TabView {
            TripView()
                .tabItem {
                    Label("Trips", systemImage: "suitcase")
                }
            StepView()
                .tabItem {
                    Label("Steps", systemImage: "figure.walk")
                }
            VisitView()
                .tabItem {
                    Label("Visits", systemImage: "house")
                }
            JourneyView()
                .tabItem {
                    Label("Journeys", systemImage: "car")
                }
            ActivityListView()
                .tabItem {
                    Label("Activities", systemImage: "car")
                }
//           PlacemarkView()
//                .tabItem {
//                    Label("Visits", systemImage: "house")
//                }
        }
    }
}


//#Preview {
//    ContentView()
//        .modelContainer(PreviewContainer.preview)
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(PreviewContainer.preview)
    }
}
