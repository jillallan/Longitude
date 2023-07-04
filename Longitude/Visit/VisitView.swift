//
//  VisitView.swift
//  Longitude
//
//  Created by Jill Allan on 03/07/2023.
//

import SwiftData
import SwiftUI

struct VisitView: View {
//    @Query(sort: \.arrivalDate) private var visits: [Visit]
    let visits: [Visit]
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(visits) { visit in
                        VStack {
                            // TODO: Adjust date based on length of visit
                            Text(visit.arrivalDate.formatted(date: .abbreviated, time: .shortened))
                            Text(visit.step?.placemark?.name ?? "New visit")
                        }
                    }
                }
            }
        }
    }
}

struct VisitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VisitView(visits: Visit.previews)
                .modelContainer(PreviewContainer.preview)
                .navigationTitle("Visits")
        }
    }
}

//#Preview {
//    VisitView()
//}