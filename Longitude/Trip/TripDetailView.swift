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
    let title: String
    let activities: [Activity]
    let steps: [Step]
    
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        GeometryReader { geometry in
            Map(position: $position) {
                ForEach(steps) { step in
                    if step.visit != nil {
                        Marker(step.placemarkName, coordinate: step.coordinate)
                            .tint(.indigo)
                    }
                    
                    if step.journey != nil {
                        Marker(step.placemarkName, coordinate: step.coordinate)
                    }
                }
            }
            
            .safeAreaInset(edge: .bottom) {
                ActivityView(activities: activities)
                // TODO: Add dynamic heigh
                    .frame(height: geometry.size.width / 1.5)
            }

            // TODO: Add scroll view for visits and jorneys.  Click on a journey to get steps for the journey and edit them
            
            // TODO: Enable renaming trip
                .navigationTitle(title)
                .toolbar(.hidden, for: .tabBar)
        }
    }
}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripDetailView(title: Trip.preview.title, activities: Activity.previews, steps: Step.previews)
        }
    }
}
