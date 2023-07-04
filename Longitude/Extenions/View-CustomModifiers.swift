//
//  View-CustomModifiers.swift
//  Longitude
//
//  Created by Jill Allan on 04/07/2023.
//

import Foundation
import SwiftUI

extension View {
    func cardStyle(aspectRatio: Double, cornerRadius: CGFloat) -> some View {
        modifier(cardModifier(aspectRatio: aspectRatio, cornerRadius: cornerRadius))
    }
}

struct cardModifier: ViewModifier {
    var aspectRatio: Double
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .clipped(antialiased: true)
            .aspectRatio(aspectRatio, contentMode: .fit)
            .cornerRadius(cornerRadius)
    }
}
