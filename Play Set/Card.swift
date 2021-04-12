//
//  Card.swift
//  Play Set
//
//  Created by dtermined on 02.04.2021.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id: Int
    private(set) var numberOfItems: NumberOfItems
    private(set) var color: Colors
    private(set) var opacity: Opacity
    private(set) var shape: CardShape
    
    init(id: Int, numberOfItems: NumberOfItems, color: Colors, opacity: Opacity, shape: CardShape) {
        self.id = id
        self.numberOfItems = numberOfItems
        self.color = color
        self.opacity = opacity
        self.shape = shape
    }
    
    func getNumberOfItemsAsInt () -> Int {
        switch numberOfItems {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        }
    }
}

enum CardShape: CaseIterable {
    case diamond
    case ellipse
    case rectangle
}

enum Colors: CaseIterable {
    case green
    case blue
    case red
}

enum Opacity: CaseIterable {
    case blank
    case stripped
    case filled
}

enum NumberOfItems: CaseIterable {
    case one
    case two
    case three
}

