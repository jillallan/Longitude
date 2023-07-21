//
//  JourneyStepView.swift
//  Longitude
//
//  Created by Jill Allan on 21/07/2023.
//

import SwiftUI

struct JourneyStepView: View {
    let journey: Journey
    
    @State private var isListScrollable: Bool = false
    @State private var currentAmount = CGFloat.zero
    @State private var startAmount = 50.0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ZStack {
                    List {
                        ForEach(journey.journeySteps) { step in
                            Text(step.placemarkName)
                        }
                    }
                    .allowsHitTesting(isListScrollable)
                    
                    Color.clear
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    isListScrollable = false
                                    if (currentAmount + startAmount - value.translation.height) < geometry.size.height {
                                        currentAmount -= value.translation.height
                                    } else {
                                        currentAmount = geometry.size.height - startAmount
                                    }
                                }
                                .onEnded { value in
                                    if (currentAmount + startAmount - value.translation.height) < geometry.size.height / 2 {
                                        currentAmount = .zero
                                        
                                    } else {
                                        currentAmount = geometry.size.height - startAmount
                                        isListScrollable = true
                                    }
                                }
                        )
                }
                .frame(maxWidth: .infinity, maxHeight: currentAmount + startAmount)
                .clipShape(RoundedRectangle(cornerRadius: 5.0, style: .circular))
                

//                            .offset(currentAmount)
//                            .frame(maxWidth: .infinity, maxHeight: showDetails ? 300 : 50)
//                            .onTapGesture {
//                                withAnimation {
//                                    showDetails.toggle()
//                                }
//                            }
            } // end of vstack
        }
    }
}

//#Preview {
//    JourneyStepView()
//}
