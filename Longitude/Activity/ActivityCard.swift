//
//  ActivityCard.swift
//  Longitude
//
//  Created by Jill Allan on 18/07/2023.
//

import SwiftData
import SwiftUI

struct ActivityCard: View {
    let activity: Activity
    @Binding var scrolledSteps: [Step]
    @Binding var scrolledID: PersistentIdentifier?
    
    var body: some View {
        VStack {
            if let journey = activity.journey {
                JourneyCard(journeys: [journey], scrolledSteps: $scrolledSteps)

            } else if let visit = activity.visit {
                VisitCard(visit: visit)
                
            }
        }
    }
}

//#Preview {
//    ActivityCard(activity: .preview)
//}
