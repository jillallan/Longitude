//
//  TripView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftData
import SwiftUI

struct TripView: View {
    
    // MARK: - Data Properties
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Trip.startDate, order: .forward) private var trips: [Trip]
    
    // MARK: - Navigation Properties
    @State private var isAddTripViewPresented: Bool = false
    @State private var navPath = NavigationPath()
    
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
                                endDate: trip.endDateString,
                                aspectRatio: 1.0
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
            
            // MARK: - Navigation
            .navigationTitle("Trips")
            .navigationDestination(for: Trip.self) { trip in
                TripDetailView(trip: trip, navPath: $navPath)
            }
            .navigationDestination(for: Step.self) { step in
                StepDetailView(date: step.timestamp)
            }
            .toolbar {
                Button {
                    isAddTripViewPresented.toggle()
                } label: {
                    Label("Add Trip", systemImage: "plus")
                }
            }
            .sheet(isPresented: $isAddTripViewPresented) {
                AddTripView(navPath: $navPath)
            }
        }
    }
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
