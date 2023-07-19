//
//  StepView.swift
//  Longitude
//
//  Created by Jill Allan on 03/07/2023.
//

import MapKit
import SwiftData
import SwiftUI

struct StepView: View {
    @Query(sort: \.timestamp) private var steps: [Step]
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(steps) { step in
                        HStack {
                            Text(step.title)
                            Text(step.placemarkName)
                        }
                    }
                }
                Map(position: $position) {
                    ForEach(steps) { step in
                        Marker(step.placemarkName, coordinate: step.coordinate)
                    }
                }
            }
            .navigationTitle("Steps")
        }
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StepView()
                .modelContainer(PreviewContainer.preview)
        }
    }
}

//#Preview {
//    StepView()
//}
