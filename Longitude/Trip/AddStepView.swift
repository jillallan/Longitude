//
//  AddStepView.swift
//  Longitude
//
//  Created by Jill Allan on 05/09/2023.
//

import CoreLocation
import SwiftUI

struct AddStepView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var name: String = ""
    @State var date: Date
    @State var coordinate: CLLocationCoordinate2D
    @State var journey: Journey
    @Binding var navPath: NavigationPath
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Text(name)
                DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
//                TextField("0.0", value: $coordinate.latitude, formatter: NumberFormatter().)
//                TextField(coordinate.latitude, format: .number)
                Text(coordinate.longitude, format: .number)
                Toggle(isOn: .constant(false)) {
                    Label("Automatically track trip", systemImage: "location")
                }
            }
            .navigationTitle("Add New Trip")
            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
                ToolbarItem {
                    Button("Save") {
                        dismiss()
                        addStep()
                    }
                }
//                ToolbarItem(placement: .topBarLeading) {
                ToolbarItem {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addStep() {
        let newStep = Step(timestamp: date, coordinate: coordinate)
        modelContext.insert(newStep)
        newStep.journey = journey
        navPath.append(newStep)
    }
}

//#Preview {
//    AddStepView(
//        date: Date.now,
//        coordinate: CLLocationCoordinate2D(
//            latitude: 51.5,
//            longitude: 0.0),
//
//    )
//}
