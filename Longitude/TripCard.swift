//
//  TripCard.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftUI

struct TripCard: View {
    let title: String
    let startDate: String
    let endDate: String
    
    var body: some View {
        Image(.mongolia)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .clipped(antialiased: true)
            .aspectRatio(1.0, contentMode: .fit)
            .cornerRadius(25.0)
            .overlay {
                TripCardOverlay(title: title, startDate: startDate, endDate: endDate)
            }
    }
}

//#Preview {
//    TripCard(title: "Mongolia", startDate: String(describing: Date.now), endDate: Date.now)
//}
