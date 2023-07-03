//
//  TripDetailView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import MapKit
import SwiftUI

struct TripDetailView: View {
    let title: String
    
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $position) {
            // TODO: Add annotations for visits and steps
        }
        // TODO: Add scroll view for visits and jorneys.  Click on a journey to get steps for the journey and edit them
        
        // TODO: Enable renaming trip
            .navigationTitle(title)
    }
}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripDetailView(title: Trip.preview.title)
        }
    }
}
