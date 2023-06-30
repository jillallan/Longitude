//
//  TripCardOverlay.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftUI

struct TripCardOverlay: View {
    let title: String
    let startDate: String
    let endDate: String
    
    var body: some View {
        
        // TODO: Place colour / text based on background
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Text(title)
                    .font(.largeTitle)
                    
                Text(startDate) + Text(" - ") + Text(endDate)
                
            }
            Spacer()
        }
        .padding()
        .foregroundStyle(.white)
    }
}


struct TripCardOverlay_Previews: PreviewProvider {
    static var previews: some View {
        TripCardOverlay(title: Trip.preview.title, startDate: Trip.preview.startDateString, endDate: Trip.preview.endDateString)
            .background {
                Image(.mongolia)
            }
    }
}

//#Preview {
//    TripCardOverlay(title: Trip.preview.title, startDate: Trip.preview.startDateString, endDate: Trip.preview.endDateString)
//}
