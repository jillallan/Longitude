//
//  TripView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftData
import SwiftUI

struct TripView: View {
    
    // MARK: - Properties
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \.startDate) private var trips: [Trip]
    @State private var isAddTripViewPresented: Bool = false
    @State private var navPath = NavigationPath()
//    @State private var trip: Trip?
    
    var body: some View {
        NavigationStack(path: $navPath) {
            
            // MARK: - View
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(trips) { trip in
                        NavigationLink(value: trip) {
                            TripCard(
                                title: trip.title,
                                startDate: trip.startDateString,
                                endDate: trip.endDateString
                            )
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(.horizontal, 20)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(initialAnchor: .trailing)
            
            // MARK: - Navigation
            .navigationTitle("Trips")
            .navigationDestination(for: Trip.self) { trip in
                // FIXME: Move nil coaloesing to Trip model and add sorting
                TripDetailView(title: trip.title, activities: trip.activities ?? [])
            }
            .toolbar {
                Button {
//                    addTrip()
                    isAddTripViewPresented.toggle()
                } label: {
                    Label("Add Trip", systemImage: "plus")
                }
            }
            .sheet(isPresented: $isAddTripViewPresented) {
                AddTripView(navPath: $navPath)
            }

            
//            .sheet(item: $trip) {
//                moveToTripView()
//            } content: { trip in
//                AddTripView(trip: trip, navPath: $navPath)
//            }

        }
    }
//    func addTrip() {
//        let newTrip = Trip(startDate: Date.now, endDate: Date.now, title: "New Trip")
//        modelContext.insert(newTrip)
//        trip = newTrip
//    }
    
//    func moveToTripView() {
//        // TODO: comment
//        navPath.append(trip)
//    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripView()
                .modelContainer(PreviewContainer.preview)
        }
    }
}

//#Preview {
//    NavigationStack {
//        TripsView()
//            .modelContainer(PreviewContainer.preview)
//    }
//}
