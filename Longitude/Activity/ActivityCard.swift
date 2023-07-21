//
//  ActivityCard.swift
//  Longitude
//
//  Created by Jill Allan on 18/07/2023.
//

import SwiftUI

struct ActivityCard: View {
    let activity: Activity
    
    var body: some View {
        VStack {
            if let journey = activity.journey {
                JourneyCard(journey: journey)
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
            } else if let visit = activity.visit {
                VisitCard(visit: visit)
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
            }
            
        }
    }
}

//#Preview {
//    ActivityCard()
//}
