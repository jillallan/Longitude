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
    @Binding var currentActivity: Activity?
    @Binding var visibleSteps: [Step]
    @Binding var navPath: NavigationPath
    
    var body: some View {
//        let _ = print("ActivityView scroll position: \(String(describing: scrolledID))")
        
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(trips) { trip in
                    Section {
                        ForEach(trip.tripActivities) { activity in
                            ActivityCard(activity: activity, activityViewScrollID: scrolledID, visibleSteps: $visibleSteps, navPath: $navPath)
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
            currentActivity = updateCurrentActivity(for: scrolledID)
        }
        .environment(\.currentActivityID, scrolledID)
    }
    
    
    
    func getTrip(scrollPositionID: PersistentIdentifier) -> Trip? {
        let predicate = #Predicate<Trip> { $0.persistentModelID == scrollPositionID }
        let fetchDescriptor = FetchDescriptor(predicate: predicate)
        
        do {
            if let trip = try modelContext.fetch(fetchDescriptor).first {
                return trip
            }
        } catch {
            logger.warning("Failed to fetch journey: \(error.localizedDescription)")
        }
    
        return nil
    }
    
    func getJourney(scrollPositionID: PersistentIdentifier) -> Journey? {
        let predicate = #Predicate<Journey> { $0.persistentModelID == scrollPositionID }
        let fetchDescriptor = FetchDescriptor(predicate: predicate)
        
        do {
            if let journey = try modelContext.fetch(fetchDescriptor).first {
                return journey
            }
        } catch {
            logger.warning("Failed to fetch activity: \(error.localizedDescription)")
        }
    
        return nil
    }
    
    func updateCurrentActivity(for scrollPositionID: PersistentIdentifier?) -> Activity? {
        if let scrollPositionID {
            if scrollPositionID.entityName == "Activity" {
                
                let predicate = #Predicate<Activity> { $0.persistentModelID == scrollPositionID }
                let fetchDescriptor = FetchDescriptor(predicate: predicate)
                
                do {
                    let activity = try modelContext.fetch(fetchDescriptor).first
                    if let activity {
                        return activity
                    }
                } catch {
                    logger.warning("Failed to fetch activity: \(error.localizedDescription)")
                }
            }
        }
        return nil
    }
    
    func updateSteps(for scrollPositionID: PersistentIdentifier?) -> [Step] {
        if let scrollPositionID {
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
