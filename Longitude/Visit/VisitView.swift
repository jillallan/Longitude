//
//  VisitView.swift
//  Longitude
//
//  Created by Jill Allan on 03/07/2023.
//

import SwiftData
import SwiftUI

struct VisitView: View {
    @Query(sort: \.arrivalDate) private var visits: [Visit]
    var body: some View {
        NavigationStack {
            List {
                ForEach(visits) { visit in
                    VStack {
                        HStack {
                            Text(visit.arrivalDate.formatted(date: .abbreviated, time: .omitted))
                            Text(visit.departureDate.formatted(date: .abbreviated, time: .omitted))
                        }
                        HStack {
                            Text(visit.step?.coordinate.latitude ?? 0.0, format: .number)
                            Text(visit.step?.coordinate.longitude ?? 0.0, format: .number)
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
            VisitView()
                .modelContainer(PreviewContainer.preview)
                .navigationTitle("Visits")
        }
    }
}

//#Preview {
//    VisitView()
//}
