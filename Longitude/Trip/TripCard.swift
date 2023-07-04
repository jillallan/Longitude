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
            .cardStyle(aspectRatio: 1.0, cornerRadius: 25.0)
            .overlay {
                TripCardOverlay(title: title, startDate: startDate, endDate: endDate)
            }
    }
}

struct TripCard_Previews: PreviewProvider {
    static var previews: some View {
        TripCard(title: Trip.preview.title, startDate: Trip.preview.startDateString, endDate: Trip.preview.endDateString)
    }
}

//#Preview {
//    TripCard(title: Trip.preview, startDate: Trip.preview.startDateString, endDate: Trip.preview.endDateString)
//}
