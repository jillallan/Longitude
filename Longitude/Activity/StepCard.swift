//
//  StepCard.swift
//  Longitude
//
//  Created by Jill Allan on 03/08/2023.
//

import SwiftUI

struct StepCard: View {
    let step: Step
    
    var body: some View {
        HStack {
            Label("", systemImage: "arrow.forward")
                .font(.largeTitle)
            VStack(alignment: .leading) {
                
                Text("170 yd")
                    .font(.headline)
                Text(step.placemarkName)
                    .font(.subheadline)
                Divider()
            }
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    StepCard()
//}
