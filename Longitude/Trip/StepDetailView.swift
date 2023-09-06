//
//  StepDetailView.swift
//  Longitude
//
//  Created by Jill Allan on 06/09/2023.
//

import SwiftUI

struct StepDetailView: View {
    @State var date: Date
    
    var body: some View {
        Text(date, format: .dateTime)
    }
}

#Preview {
    StepDetailView(date: Date.now)
}
