//
//  Card.swift
//  Longitude
//
//  Created by Jill Allan on 24/07/2023.
//

import SwiftUI

struct Card<Content: View>: View {
    @State var image: UIImage
    @State var aspectRatio: Double
    @State var cornerRadius: Double
    @ViewBuilder var content: Content
    
//    init(image: ImageResource, aspectRatio: Double, cornerRadius: Double, @ViewBuilder content: () -> Content) {
//        let uiImage = UIImage(resource: image)
//        _image = State(initialValue: uiImage)
//        _aspectRatio = State(initialValue: aspectRatio)
//        _cornerRadius = State(initialValue: cornerRadius)
//        self.content = content()
//    }
    
//    init(image: ImageResource, aspectRatio: Double, cornerRadius: Double, @ViewBuilder content: () -> Content) {
//        let uiImage = UIImage(systemName: "plus")
//        _image = State(initialValue: image)
//        _aspectRatio = State(initialValue: aspectRatio)
//        _cornerRadius = State(initialValue: cornerRadius)
//        self.content = content()
//    }
    
    var body: some View {
        Image(uiImage: image)
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
