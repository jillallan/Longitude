//
//  TripDetailView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import MapKit
import SwiftData
import SwiftUI

struct TripDetailView: View {
    let trip: Trip    
    @State var position: MapCameraPosition = .automatic
    
    var body: some View {
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
                ActivityView(trips: [trip], position: $position)
                // TODO: Add dynamic height - based on number of items in grid and aspect ratio
                    .frame(height: geometry.size.width / 1.5)
            }
            
            // TODO: Enable renaming trip
            .navigationTitle(trip.title)
                .toolbar(.hidden, for: .tabBar)
        }
    }
    
    func updateMapPosition() -> MapCameraPosition {
        
        return MapCameraPosition.automatic
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
