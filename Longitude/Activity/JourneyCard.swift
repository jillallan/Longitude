//
//  JourneyCard.swift
//  Longitude
//
//  Created by Jill Allan on 03/08/2023.
//

import CoreLocation
import OSLog
import MapKit
import SwiftData
import SwiftUI

struct JourneyCard: View {
    
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: Self.self))

    let journeys: [Journey]
    let activityObjectID: PersistentIdentifier
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.currentActivityID) private var activityViewID
    @State var scrolledID: PersistentIdentifier?
    @Binding var visibleSteps: [Step]
    @State var currentStep: Step?
    let activityViewScrollID: PersistentIdentifier?
    
    @State private var aspectRatio = 1.5
    @State private var cornerRadius = 25.0
    
    @Binding var navPath: NavigationPath
    @State var isAddStepViewPresented: Bool = false
    
    var body: some View {
//        let _ = logger.debug("ScrolledID: \(String(describing: scrolledID)), \n activityViewScrolledID: \(String(describing: activityViewScrolledID))")
        
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(journeys) { journey in
                        Section {
                            ForEach(journey.journeySteps) { step in
                                StepCard(step: step)
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
                .scrollTargetLayout(isEnabled: true)
            }

//            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
            .scrollPosition(id: $scrolledID)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isAddStepViewPresented.toggle()
                    } label: {
                        Label("", systemImage: "plus")
                            .labelStyle(.iconOnly)
                            .frame(width: 44, height: 44)
                            .foregroundStyle(Color.white, Color.black)
                            .background(Color.indigo)
                            .clipShape(Circle())
                    }
                    .padding(4)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        .aspectRatio(aspectRatio, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .circular))
        .onChange(of: scrolledID) {
            currentStep = updateCurrentStep(for: scrolledID)
            
            if activityViewScrollID == activityObjectID {
                withAnimation {
                    visibleSteps = updateSteps(for: scrolledID)
                }
            }
        }
        .sheet(isPresented: $isAddStepViewPresented) {
            AddStepView(
                date: currentStep?.timestamp ?? journeys.first?.departureDate ?? Date.now,
                coordinate: currentStep?.coordinate ?? journeys.first?.journeySteps.first?.coordinate ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
                journey: journeys[0], navPath: $navPath
            )
        }
    }
    
    func updateCurrentStep(for scrollPositionID: PersistentIdentifier?) -> Step? {
        if let scrollPositionID {
            if scrollPositionID.entityName == "Step" {
                
                let predicate = #Predicate<Step> { $0.persistentModelID == scrollPositionID }
                let fetchDescriptor = FetchDescriptor(predicate: predicate)
                
                do {
                    let step = try modelContext.fetch(fetchDescriptor).first
                    if let step {
                        return step
                    }
                } catch {
                    logger.warning("Failed to fetch journey: \(error.localizedDescription)")
                }
            }
        }
        return nil
    }
    
    func updateSteps(for scrollPositionID: PersistentIdentifier?) -> [Step] {
        if let scrollPositionID {

            if scrollPositionID.entityName == "Journey" {

                let predicate = #Predicate<Journey> { $0.persistentModelID == scrollPositionID }
                let fetchDescriptor = FetchDescriptor(predicate: predicate)
                
                do {
                    let journey = try modelContext.fetch(fetchDescriptor).first
                    if let steps = journey?.journeySteps {
                        return steps
                    }
                } catch {
                    logger.warning("Failed to fetch journey: \(error.localizedDescription)")
                }
            }
            
            if scrollPositionID.entityName == "Step" {
                
                let predicate = #Predicate<Step> { $0.persistentModelID == scrollPositionID }
                let fetchDescriptor = FetchDescriptor(predicate: predicate)
                
                do {
                    let step = try modelContext.fetch(fetchDescriptor).first
                    if let step {
                        logger.debug("scrolledID is Journey, steps: \([step])")
                        return [step]
                    }
                } catch {
                    logger.warning("Failed to fetch journey: \(error.localizedDescription)")
                }
            }
        }
        return []
    }
}

//#Preview {
//    JourneyCard()
//}
