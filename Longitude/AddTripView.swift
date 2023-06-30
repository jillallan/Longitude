//
//  AddTripView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftUI

struct AddTripView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var title: String = ""
    @State private var startDate: Date = Date.now
    @State private var endDate: Date = Date.now
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Trip Title", text: $title)
                DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                Toggle(isOn: .constant(false)) {
                    Label("Automatically track trip", systemImage: "location")
                }
            }
            .navigationTitle("Add New Trip")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        addTrip()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addTrip() {
        let newTrip = Trip(startDate: startDate, endDate: endDate, title: title)
        modelContext.insert(newTrip)
    }
}

//struct AddTripView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTripView()
//            .modelContainer(PreviewContainer.preview)
//    }
//}

#Preview {
    AddTripView()
}
