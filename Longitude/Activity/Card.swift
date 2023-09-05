//
//  Card.swift
//  Longitude
//
//  Created by Jill Allan on 24/07/2023.
//

import UIKit
import SwiftUI

struct Card<Content: View>: View {
//    @State var image: UIImage
//    @State var image: UIImage
    @State var imageResource: ImageResource
    @State var aspectRatio: Double
    @State var cornerRadius: Double
    @ViewBuilder var content: Content
    
    var body: some View {
//        Image(uiImage: image)
        Image(imageResource)
            .resizable()
            .scaledToFill()
            .cardStyle(aspectRatio: aspectRatio, cornerRadius: cornerRadius)
            .overlay {
                content
            }
        
    }
}

//#Preview {
//    Card(aspectRatio: 1.5, cornerRadius: 25.0) {
//        Text("Hello world")
//    }
//}
