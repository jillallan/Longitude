//
//  TripsView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftData
import SwiftUI

struct TripsView: View {
    @Query private var trips: [Trip]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(trips) { trip in
                        Text(trip.title)
                    }
                }
            }
            .navigationTitle("Trips")
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
