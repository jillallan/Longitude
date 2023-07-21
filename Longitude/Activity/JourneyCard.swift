//
//  JourneyCard.swift
//  Longitude
//
//  Created by Jill Allan on 17/07/2023.
//

import SwiftUI

struct JourneyCard: View {
    let journey: Journey
    @State private var aspectRatio = 1.5
    @State private var isListScrollable: Bool = false
    
    @State private var currentAmount = CGFloat.zero
    @State private var startAmount = 50.0
    
    var body: some View {
        
        VStack {
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
                .overlay {
                    JourneyStepView(journey: journey)
                }
        }
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .circular))
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
