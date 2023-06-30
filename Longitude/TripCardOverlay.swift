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
        VStack {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                Text(startDate)
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    TripCardOverlay(title: "Mongolia", startDate: Date.now, endDate: Date.now)
//}
