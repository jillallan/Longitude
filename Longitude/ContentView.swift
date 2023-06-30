//
//  ContentView.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        TabView {
            TripsView()
                .tabItem {
                    Label("Trips", image: "")
                }
        }
    }
}


//#Preview {
//    ContentView()
//        .modelContainer(PreviewContainer.preview)
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(PreviewContainer.preview)
    }
}
