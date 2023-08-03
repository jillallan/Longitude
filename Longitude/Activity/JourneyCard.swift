//
//  JourneyCard.swift
//  Longitude
//
//  Created by Jill Allan on 03/08/2023.
//

import SwiftData
import SwiftUI

struct JourneyCard: View {

    @Environment(\.modelContext) private var modelContext
    let journeys: [Journey]
    @State var scrolledID: PersistentIdentifier?
    @Binding var scrolledSteps: [Step]
    
    @State private var aspectRatio = 1.5
    @State private var cornerRadius = 25.0
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(journeys) { journey in
                        Section {
                            ForEach(journey.journeySteps) { step in
                                StepCardSimple(step: step)
                            }
                        } header: {
                            JourneyCardHeader(journey: journey)
                        } footer: {
                            VStack {
                                Spacer()
                                Text("Journey Metadata")
                                Spacer()
                            }
                            .padding(50)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $scrolledID)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        .aspectRatio(aspectRatio, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .circular))
        .onChange(of: scrolledID) { oldValue, newValue in
            scrolledSteps = updateSteps(newID: newValue)
        }
    }
        
    func updateSteps(newID: PersistentIdentifier?) -> [Step] {
        if let newID {
            if newID.entityName == "Journey" {
                let journey = modelContext.object(with: newID) as! Journey
                return journey.journeySteps
                
            } else if newID.entityName == "Step" {
                let step = modelContext.object(with: newID) as! Step
                return [step]
            }
        }
        return []
    }
}

//#Preview {
//    JourneyCard()
//}
