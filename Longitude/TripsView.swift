//
//  TripsView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftData
import SwiftUI

struct TripsView: View {
    
    // MARK: - Properties
    @Query private var trips: [Trip]
    @State private var isAddTripViewPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            
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
            
            // MARK: - Navigation
            .navigationTitle("Trips")
            .navigationDestination(for: Trip.self) { trip in
                // TODO: Add TripView
                TripCard(
                    title: trip.title,
                    startDate: trip.startDateString,
                    endDate: trip.endDateString
                )
            }
            .toolbar {
                Button {
                    isAddTripViewPresented.toggle()
                } label: {
                    Label("Add Trip", systemImage: "plus")
                }
            }
            .sheet(isPresented: $isAddTripViewPresented) {
                // TODO: Add AddTripView
            }
        }
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripsView()
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
