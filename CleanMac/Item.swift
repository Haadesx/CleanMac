//
//  Item.swift
//  CleanMac
//
//  Created by Varesh Patel on 2/5/26.
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
