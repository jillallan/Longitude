//
//  ActivityView.swift
//  Longitude
//
//  Created by Jill Allan on 04/07/2023.
//

import CoreLocation
import MapKit
import SwiftData
import SwiftUI

struct ActivityView: View {
    let trips: [Trip]
    
    @Environment(\.modelContext) private var modelContext

    @State private var scrolledID: PersistentIdentifier?
    @Binding var position: MapCameraPosition
    @State var scrolledSteps: [Step] = []
    
    var body: some View {
        let _ = print("ActivityView scroll position: \(String(describing: scrolledID))")
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(trips) { trip in
                    Section {
                        ForEach(trip.tripActivities) { activity in
                            ActivityCard(activity: activity, scrolledSteps: $scrolledSteps, scrolledID: $scrolledID)
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                        }
                        
                    } header: {
                        TripCard(title: trip.title, startDate: trip.startDateString, endDate: trip.endDateString, aspectRatio: 1.5)
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                        
                    } footer: {
                        VStack {
                            Label("Add new visit or journey", systemImage: "plus")
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray)
                        .aspectRatio(1.5, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .circular))
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
        .onChange(of: scrolledID) { oldValue, newValue in
            withAnimation {
                position = calculateCoordinateRegion(newID: newValue)
            }
        }
        .onChange(of: scrolledSteps) { oldValue, newValue in
            withAnimation {
                print("Activity view, scrolled ID: \(String(describing: newValue))")
                position = calculateCoordinateRegion(steps: newValue)
            }
        }
    }
    
    func calculateCoordinateRegion(newID: PersistentIdentifier?) -> MapCameraPosition {
        if let newID {
            if newID.entityName == "Trip" {
                return MapCameraPosition.automatic
                
            } else if newID.entityName == "Activity" {
                
                let activity = modelContext.object(with: newID) as! Activity
                if let visitCoordinates = activity.visit?.step?.coordinate {
                    return MapCameraPosition.region(MKCoordinateRegion(center: visitCoordinates, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
        
                    // FIXME: Should be region for all in step
                } else if let journeySteps = activity.journey?.journeySteps {
                    let region = calculateCoordianteRegion(from: journeySteps.map(\.coordinate))
                    return MapCameraPosition.region(region)
 
                }
            }
        }
        return MapCameraPosition.automatic
    }
    
    func calculateCoordinateRegion(steps: [Step]) -> MapCameraPosition {
        let region = calculateCoordianteRegion(from: steps.map(\.coordinate))
        return MapCameraPosition.region(region)
    }
    
    func calculateCoordianteRegion(from coordinates: [CLLocationCoordinate2D]) -> MKCoordinateRegion {

        let minLatitude = coordinates.map(\.latitude).min() ?? 0.0
        let maxLatitude = coordinates.map(\.latitude).max() ?? 0.0
        let minLongitude = coordinates.map(\.longitude).min() ?? 0.0
        let maxLongitude = coordinates.map(\.longitude).max() ?? 0.0
        
        let center = CLLocationCoordinate2D(
            latitude: (minLatitude + maxLatitude) / 2,
            longitude: (minLongitude + maxLongitude) / 2
        )
        
        let span = MKCoordinateSpan(
            latitudeDelta: (maxLatitude - minLatitude) == 0 ? 0.002 : (maxLatitude - minLatitude) * 1.5,
            longitudeDelta: (maxLongitude - minLongitude) == 0 ? 0.002 : (maxLongitude - minLongitude) * 1.5
        )
        return MKCoordinateRegion(center: center, span: span)
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
