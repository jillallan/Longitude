//
//  ActivityView.swift
//  Longitude
//
//  Created by Jill Allan on 04/07/2023.
//

import SwiftUI

struct ActivityView: View {
    let activities: [Activity]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(activities) { activity in
                    if let visit = activity.visit {
                        VStack {
                            // TODO: Adjust date based on length of visit
                            Text(visit.arrivalDate.formatted(date: .abbreviated, time: .shortened))
                            Text(visit.step?.placemark?.name ?? "New visit")
                        }
                    } else if let journey = activity.journey {
                        VStack {
                            // TODO: Adjust date based on length of visit
                            Text(journey.arrivalDate.formatted(date: .abbreviated, time: .shortened))
                            // TODO: Foreach for steps
                        }
                    }
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ActivityView(activities: Activity.previews)
                .modelContainer(PreviewContainer.preview)
                .navigationTitle("Visits")
        }
    }
}

//#Preview {
//    ActivityView(activities: Activity.previews)
//}
