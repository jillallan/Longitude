//
//  Item.swift
//  Longitude
//
//  Created by Jill Allan on 30/06/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
