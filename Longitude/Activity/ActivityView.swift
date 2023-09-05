//
//  ActivityView.swift
//  Longitude
//
//  Created by Jill Allan on 04/07/2023.
//

import CoreLocation
import MapKit
import OSLog
import SwiftData
import SwiftUI

struct ActivityView: View {
    
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: Self.self))
    
    let trips: [Trip]
    
    @Environment(\.modelContext) private var modelContext

    @State private var scrolledID: PersistentIdentifier?
    
    @Binding var visibleSteps: [Step]
    
    var body: some View {
//        let _ = print("ActivityView scroll position: \(String(describing: scrolledID))")
        
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(trips) { trip in
                    Section {
                        ForEach(trip.tripActivities) { activity in
                            ActivityCard(activity: activity, activityViewScrollID: scrolledID, visibleSteps: $visibleSteps)
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                        }
                        
                    } header: {
                        TripCard(title: trip.title, startDate: trip.startDateString, endDate: trip.endDateString, aspectRatio: 1.5)
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                        
                    }
                }
            }
            .scrollTargetLayout(isEnabled: true)
        }
        .safeAreaPadding(.horizontal, 20)
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
        .scrollPosition(id: $scrolledID)
        .onChange(of: scrolledID) {
            withAnimation {
                visibleSteps = updateSteps(for: scrolledID)
            }
        }
        .environment(\.currentActivityID, scrolledID)
    }
    
    func updateSteps(for scrollPositionID: PersistentIdentifier?) -> [Step] {
        if let scrollPositionID {
            
            if scrollPositionID.entityName == "Trip" {
                
                let predicate = #Predicate<Trip> { $0.persistentModelID == scrollPositionID }
                let fetchDescriptor = FetchDescriptor(predicate: predicate)
                
                do {
                    let trip = try modelContext.fetch(fetchDescriptor).first
                    if let steps = trip?.steps {
                        return steps
                    }
                } catch {
                    logger.warning("Failed to fetch journey: \(error.localizedDescription)")
                }
            }
            
            if scrollPositionID.entityName == "Activity" {
                
                let predicate = #Predicate<Activity> { $0.persistentModelID == scrollPositionID }
                let fetchDescriptor = FetchDescriptor(predicate: predicate)
                
                do {
                    let activity = try modelContext.fetch(fetchDescriptor).first
                    if let steps = activity?.steps {
                        return steps
                    }
                } catch {
                    logger.warning("Failed to fetch journey: \(error.localizedDescription)")
                }
            }
        }
        return []
    }

}

private struct CurrentActivityIDKey: EnvironmentKey {
    static let defaultValue: PersistentIdentifier? = nil
}

extension EnvironmentValues {
    var currentActivityID: PersistentIdentifier? {
        get { self[CurrentActivityIDKey.self] }
        set { self[CurrentActivityIDKey.self] = newValue }
    }
}

//
//struct ActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            ActivityView(trip: .preview, activities: Activity.previews)
//                .modelContainer(PreviewContainer.preview)
//                .navigationTitle("Visits")
//        }
//    }
//}

//#Preview {
//    ActivityView(activities: Activity.previews)
//}
