//
//  AddJourneyView.swift
//  Longitude
//
//  Created by Jill Allan on 05/09/2023.
//

import SwiftUI

struct AddJourneyView: View {
    let date: Date
    
    var body: some View {
        Text(date, style: .time)
    }
}

#Preview {
    AddJourneyView(date: Date.now)
}
