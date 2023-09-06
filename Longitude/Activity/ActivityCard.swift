//
//  ActivityCard.swift
//  Longitude
//
//  Created by Jill Allan on 18/07/2023.
//

import CoreLocation
import OSLog
import MapKit
import SwiftData
import SwiftUI

struct ActivityCard: View {
    
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: Self.self))
    
    let activity: Activity

    let activityViewScrollID: PersistentIdentifier?
    @Binding var visibleSteps: [Step]
    @Binding var navPath: NavigationPath
    @Environment(\.currentActivityID) private var activityViewID
    
    
    var body: some View {
        VStack {
            if let journey = activity.journey {
                JourneyCard(journeys: [journey], activityObjectID: activity.persistentModelID, visibleSteps: $visibleSteps, activityViewScrollID: activityViewScrollID, navPath: $navPath)

            } else if let visit = activity.visit {
                VisitCard(visit: visit)
                
            }
        }
        .onAppear {
            logger.debug("ActivityView activityID: \(String(describing: activity.persistentModelID))")
            logger.debug("ActivityView Environment currentActivityID: \(String(describing: activityViewScrollID))")
            logger.debug("match: \(activity.persistentModelID == activityViewScrollID)")
            
//            logger.debug("Activity Card - activityViewScrollID: \(String(describing: activityViewScrollID))")
//            logger.debug("Activity description: \(activity.debugDescription)")
        }
        .onChange(of: activityViewScrollID) {
            logger.debug("ActivityView Environment currentActivityID cahnged: \(String(describing: activityViewScrollID))")
            logger.debug("match: \(activity.persistentModelID == activityViewScrollID)")
            if activityViewID == activityViewScrollID {
                logger.debug("scroll id's match")
            } else {
                logger.debug("scroll id's don't match")
            }
            
            if activity.persistentModelID == activityViewScrollID {
                logger.debug("object id's match")
            } else {
                logger.debug("object id's don't match")
            }
        }
    }
}

//#Preview {
//    ActivityCard(activity: .preview)
//}
