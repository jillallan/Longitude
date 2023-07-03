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
                    VStack {
                        Text(step.timestamp.formatted(date: .abbreviated, time: .omitted))
                        HStack {
                            Text(step.coordinate.latitude, format: .number)
                            Text(step.coordinate.longitude, format: .number)
                        }
                    }
                }
            }
        }
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StepView()
                .modelContainer(PreviewContainer.preview)
                .navigationTitle("Steps")
        }
    }
}

//#Preview {
//    StepView()
//}
