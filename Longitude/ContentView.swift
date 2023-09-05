//
//  ContentView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import OSLog
import SwiftUI
import SwiftData

struct ContentView: View {
    
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: Self.self))
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        TabView {
            TripView()
                .tabItem {
                    Label("Trips", systemImage: "suitcase")
                }
                .onAppear {
                    checkSampleStore()
                }
        }
    }
    
    func checkSampleStore() {
        let visitFetchDescriptor = FetchDescriptor<Visit>()
        do {
            let visits = try modelContext.fetch(visitFetchDescriptor)
            
            _ = visits.sorted().map { visit in
                logger.debug("Visit: \(visit.arrivalDate), \(String(describing: visit.step?.placemarkName)), \(String(describing: visit.step?.coordinate))")
            }
        } catch {
            fatalError("Error fetching visit in Visit Preview: \(error.localizedDescription)")
        }
        
        let journeyFetchDescriptor = FetchDescriptor<Journey>()
        do {
            let journeys = try modelContext.fetch(journeyFetchDescriptor)
            
            _ = journeys.sorted().map { journey in
                logger.debug("Journey: \(journey.departureDate)")
                
                _ = journey.journeySteps.map { step in
                    logger.debug("Step: \(step.timestamp), \(step.placemarkName), \(String(describing: step.coordinate))")
                }
            }
        } catch {
            fatalError("Error fetching visit in Visit Preview: \(error.localizedDescription)")
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
