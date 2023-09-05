//
//  TripDetailView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import MapKit
import OSLog
import SwiftData
import SwiftUI

struct TripDetailView: View {
    
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: Self.self))
    
    let trip: Trip
//    @State var coordinates: [CLLocationCoordinate2D]?
    @State var visibleSteps: [Step] = []
    @State var position: MapCameraPosition = .automatic
    
    var body: some View {
        let _ = logger.debug("TripDetailsView Steps: \(visibleSteps)")
        
        GeometryReader { geometry in
            Map(position: $position) {
                ForEach(trip.steps) { step in
                    if step.visit != nil {
                        Annotation("", coordinate: step.coordinate) {
                            Circle()
                                .size(width: 24, height: 24)
                                .fill(.indigo)
                        }
                    }
                    
                    if step.journey != nil {
                        Annotation("", coordinate: step.coordinate) {
                            Circle()
                                .size(width: 12, height: 12)
                                .fill(.indigo)
                        }
                    }
                }
                MapPolyline(coordinates: trip.steps.map(\.coordinate))
                    .stroke(.indigo, lineWidth: 3)
            }
            .safeAreaInset(edge: .bottom) {
                ActivityView(trips: [trip], visibleSteps: $visibleSteps)
            
                // TODO: Add dynamic height - based on number of items in grid and aspect ratio
                    .frame(height: geometry.size.width / 1.5)
            }
            
            // TODO: Enable renaming trip
            .navigationTitle(trip.title)
//                .toolbar(.hidden, for: .tabBar)
        }
        .onChange(of: visibleSteps) {
            withAnimation {
                position = updateMapPosition(for: visibleSteps)
            }
        }
//        .onChange(of: coordinates) { oldValue, newValue in
//            if let newValue {
//                logger.debug("Trip detail view coordinates changed")
//                withAnimation {
//                    position = updateMapPosition(for: newValue)
//                }
//            }
//        }
    }
    
    func updateMapPosition(for steps: [Step]) -> MapCameraPosition {
        logger.debug("\(#function): \(String(describing: steps))")
        
//        if let steps {
            let region = calculateCoordianteRegion(from: steps.map(\.coordinate))
            return MapCameraPosition.region(region)
//        }
        
//        return MapCameraPosition.automatic
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

//struct TripDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            TripDetailView(title: Trip.preview.title, activities: Activity.previews, steps: Step.previews)
//        }
//    }
//}


//private struct MainWindowSizeKey: EnvironmentKey {
//    static let defaultValue: CGSize = .zero
//}
//
//extension EnvironmentValues {
//    var mainWindowSize: CGSize {
//        get { self[MainWindowSizeKey.self] }
//        set { self[MainWindowSizeKey.self] = newValue }
//    }
//}
