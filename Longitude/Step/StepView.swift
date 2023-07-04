//
//  StepView.swift
//  Longitude
//
//  Created by Jill Allan on 03/07/2023.
//

import SwiftData
import SwiftUI

struct StepView: View {
    @Query(sort: \.timestamp) private var steps: [Step]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(steps) { step in
                    HStack {
                        Text(step.timestamp.formatted(date: .abbreviated, time: .shortened))
                        Text(step.placemarkName)
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
