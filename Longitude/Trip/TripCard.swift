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
    @State var aspectRatio: Double
    
    var body: some View {
        Card(image: .mongolia, aspectRatio: aspectRatio, cornerRadius: 25.0) {
            TripCardOverlay(title: title, startDate: startDate, endDate: endDate)
        }
    }
}

struct TripCard_Previews: PreviewProvider {
    static var previews: some View {
        TripCard(title: Trip.preview.title, startDate: Trip.preview.startDateString, endDate: Trip.preview.endDateString, aspectRatio: 1.0)
    }
}

//#Preview {
//    TripCard(title: Trip.preview, startDate: Trip.preview.startDateString, endDate: Trip.preview.endDateString)
//}
