//
//  ActivityListView.swift
//  Longitude
//
//  Created by Jill Allan on 18/07/2023.
//

import SwiftData
import SwiftUI

struct ActivityListView: View {
    @Query(sort: \.timestamp) private var activities: [Activity]
    
    var body: some View {
        NavigationStack {
            List(activities) { activity in
                
                
                VStack {
                    Text(activity.timestamp.formatted(date: .abbreviated, time: .shortened))
                    if let visit = activity.visit {
                        Text(visit.arrivalDate.formatted(date: .abbreviated, time: .shortened))
                    } else if let journey = activity.journey {
                        Text(journey.departureDate.formatted(date: .abbreviated, time: .shortened))
                    }
                    Text((activity.visit != nil) ? "Visit" : "No visit")
                    Text((activity.journey != nil) ? "Journey" : "No journey")
                }
            }
        }
    }
}

#Preview {
    ActivityListView()
}
