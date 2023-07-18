//
//  JourneyCard.swift
//  Longitude
//
//  Created by Jill Allan on 17/07/2023.
//

import SwiftUI

struct JourneyCard: View {
    let journey: Journey
    
    var body: some View {
        Image(.london)
            .resizable()
            .scaledToFill()
            .cardStyle(aspectRatio: 1.5, cornerRadius: 25)
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()
                    // TODO: Adjust date based on length of visit
                    Text(journey.departureDate.formatted(date: .abbreviated, time: .shortened))
                    Text("New journey")
                }
                .foregroundStyle(.white)
                .padding()
            }
    }
}

struct JourneyCard_Previews: PreviewProvider {
    static var previews: some View {
        JourneyCard(journey: .preview)
    }
}

//#Preview {
//    JourneyCard()
//}
