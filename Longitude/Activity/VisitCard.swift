//
//  VisitCard.swift
//  Longitude
//
//  Created by Jill Allan on 04/07/2023.
//

import SwiftUI

struct VisitCard: View {
    let visit: Visit
    
    var body: some View {
        Image(.mongolia)
            .resizable()
            .scaledToFill()
            .cardStyle(aspectRatio: 1.5, cornerRadius: 25)
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()
                    // TODO: Adjust date based on length of visit
                    Text(visit.arrivalDate.formatted(date: .abbreviated, time: .shortened))
                    Text(visit.step?.placemark?.name ?? "New visit")
                }
                .foregroundStyle(.white)
                .padding()
            }
    }
}

struct VisitCard_Previews: PreviewProvider {
    static var previews: some View {
        VisitCard(visit: Visit.preview)
    }
}

//#Preview {
//    VisitCard()
//}
