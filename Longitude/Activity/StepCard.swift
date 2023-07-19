//
//  StepCard.swift
//  Longitude
//
//  Created by Jill Allan on 18/07/2023.
//

import SwiftUI

struct StepCard: View {
    let step: Step
    
    var body: some View {
        Image(.russia)
            .resizable()
            .scaledToFill()
            .cardStyle(aspectRatio: 1.5, cornerRadius: 25)
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()
                    // TODO: Adjust date based on length of visit
                    Text(step.timestamp.formatted(date: .abbreviated, time: .shortened))
                    Text(step.placemarkName)
                }
                .foregroundStyle(.white)
                .padding()
            }
    }
}


//#Preview {
//    StepCard(step: .preview)
//}
