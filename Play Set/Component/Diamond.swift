//
//  Diamond.swift
//  Play Set
//
//  Created by dtermined on 12.04.2021.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let left = CGPoint(x: rect.minX, y: rect.midY),
            top = CGPoint(x: rect.midX, y: rect.minY),
            right = CGPoint(x: rect.maxX, y: rect.midY),
            bottom = CGPoint(x: rect.midX, y: rect.maxY)
        
        p.addLines([top, right, bottom, left, top])
        
        return p
    }
}
