//
//  JourneyView.swift
//  Longitude
//
//  Created by Jill Allan on 18/07/2023.
//

import SwiftData
import SwiftUI

struct JourneyView: View {
    @Query(sort: \.departureDate) private var journeys: [Journey]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(journeys) { journey in
                    // TODO: Adjust date based on length of visit
                    Text(journey.departureDate.formatted(date: .abbreviated, time: .shortened))
//                    Text(visit.step?.placemark?.name ?? "New visit")
                }
            }
        }
    }
}

#Preview {
    JourneyView()
}
