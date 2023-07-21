//
//  ActivityView.swift
//  Longitude
//
//  Created by Jill Allan on 04/07/2023.
//

import SwiftData
import SwiftUI

struct ActivityView: View {
    let title: String
    let activities: [Activity]
    @Query private var trips: [Trip]
    @Environment(\.modelContext) private var modelContext
    
    @State private var scrolledID: PersistentIdentifier?
    @State private var scrolledText: String
    
    init(title: String, activities: [Activity]) {
        self.title = title
        self.activities = activities
        let fetchDescriptor = FetchDescriptor<Trip>(predicate: #Predicate { $0.title == title })
        _trips = Query(fetchDescriptor)
        _scrolledText = State(initialValue: title)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(scrolledText)
                    .fontWeight(.light)
                    .font(.caption)
                    .foregroundStyle(.indigo)
                Spacer()
            }
            .padding(.horizontal)
                
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(trips) { trip in
                        Section {
                            ForEach(trip.tripActivities) { activity in
                                ActivityCard(activity: activity)
                                
                                // TODO: Adjust date based on length of visit
                                // TODO: Foreach for steps
                            }
                        } header: {
                            TripCard(title: trip.title, startDate: trip.startDateString, endDate: trip.endDateString, aspectRatio: 1.5)
                        } footer: {
                            Text("New Visit or Journey")
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(.horizontal, 20)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .scrollPosition(id: $scrolledID)
            .onChange(of: scrolledID) { oldValue, newValue in
                updateText(oldID: oldValue, newID: newValue)
            }
        }
    }
    
    func updateText(oldID: PersistentIdentifier?, newID: PersistentIdentifier?) {
        if let scrolledID {
            if scrolledID.entityName == "Trip" {
                let trip = modelContext.object(with: scrolledID) as! Trip
                scrolledText = trip.title
            } else if scrolledID.entityName == "Activity" {
                let activity = modelContext.object(with: scrolledID) as! Activity
                scrolledText = activity.timestamp.formatted(date: .abbreviated, time: .shortened)
            }
        }
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
