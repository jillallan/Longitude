//
//  PlacemarkView.swift
//  Longitude
//
//  Created by Jill Allan on 03/07/2023.
//

import SwiftData
import SwiftUI

struct PlacemarkView: View {
    @Query private var placemarks: [Placemark]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(placemarks) { placemark in
                    VStack {
                        Text(placemark.name)
                        HStack {
                            Text(placemark.coordinate.latitude, format: .number)
                            Text(placemark.coordinate.longitude, format: .number)
                        }
                    }
                }
            }
            .navigationTitle("Placemarks")
        }
    }
}

struct PlacemarkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlacemarkView()
                .modelContainer(PreviewContainer.preview)
        }
    }
}

//#Preview {
//    PlacemarkView()
//}
