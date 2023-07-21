//
//  TripCard.swift
//  Longitude
//
//  Created by Jill Allan on 19/07/2023.
//

import SwiftUI

struct TripOverviewCard: View {
    let trip: Trip
    
    var body: some View {
        Image(.russia)
            .resizable()
            .scaledToFill()
            .cardStyle(aspectRatio: 1.5, cornerRadius: 25)
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(trip.title)
                    Text(trip.startDateString)
                }
                .foregroundStyle(.white)
                .padding()
            }
    }
}

//#Preview {
//    TripOverviewCard(trip: .preview)
//}
