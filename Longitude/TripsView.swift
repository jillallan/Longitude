//
//  TripsView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftUI

struct TripsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(content: {
                    ForEach(1...10, id: \.self) { count in
                        Text("Placeholder \(count)")
                    }
                })
            }
            .navigationTitle("Trips")
        }
    }
}

#Preview {
    NavigationStack {
        TripsView()
    }
}
