//
//  JourneyCardHeader.swift
//  Longitude
//
//  Created by Jill Allan on 17/07/2023.
//

import SwiftUI

struct JourneyCardHeader: View {
    let journey: Journey
    
    var body: some View {
        VStack {
            Card(image: .london, aspectRatio: 2, cornerRadius: 0.0) {
                VStack(alignment: .leading) {
                    
                    // TODO: Adjust date based on length of visit
                    Text(journey.departureDate.formatted(date: .abbreviated, time: .shortened))
                    Text("New journey")
                    Spacer()
                    
                }
                .fontWeight(.light)
                .foregroundStyle(.white)
                .padding()
            }
        }
    }
}

struct JourneyCardHeader_Previews: PreviewProvider {
    static var previews: some View {
        JourneyCardHeader(journey: .preview)
    }
}

//#Preview {
//    JourneyCardHeader()
//}


//GeometryReader { geometry in
//    VStack {
//        Spacer()
//        JourneyStepList(journey: journey, isListScrollable: isStepListScrollable)
//            .frame(width: geometry.size.width, height: height)
//    }
//    .contentShape(Rectangle())
//    .gesture(
//        DragGesture(minimumDistance: 20, coordinateSpace: .local)
//            .onChanged { value in
//                withAnimation {
//                    if height - value.translation.height < 50 {
//                        height = 50
//                    } else if height - value.translation.height > geometry.size.height {
//                        height = geometry.size.height
//                    } else {
//                        height -= value.translation.height
//                    }
//                    
//                }
//            }
//            .onEnded { value in
//                withAnimation {
//                    let viewHeight = geometry.size.height
//                    let verticalDrag = -value.translation.height
//                    
//                    if height + verticalDrag < 50 {
//                        height = 50
//                        isStepListScrollable = false
//                    } else if height + verticalDrag > viewHeight {
//                        height = viewHeight
//                        isStepListScrollable = true
//                    } else if height + verticalDrag < viewHeight / 2 {
//                        height = 50
//                        isStepListScrollable = false
//                    } else if height + verticalDrag > viewHeight / 2 {
//                        height = viewHeight
//                        isStepListScrollable = true
//                    }
//                }
//            }
//    )
//}
