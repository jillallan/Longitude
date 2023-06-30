//
//  TripView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import MapKit
import SwiftUI

struct TripView: View {
    let title: String
    
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $position) {
            // TODO: Add annotations for visits and steps
        }
        
        // TODO: Enable renaming trip
            .navigationTitle(title)
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripView(title: Trip.preview.title)
        }
    }
}
