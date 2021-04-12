//
//  Figure.swift
//  Play Set
//
//  Created by dtermined on 12.04.2021.
//

import SwiftUI

struct Figure: View {
    var color: Colors
    var shape: CardShape
    var opacity: Opacity
    
    private func getBody () -> some View {
        var someBody: AnyShape
        
        switch shape {
        case .ellipse:
            someBody = AnyShape(Capsule())
        case .diamond:
            someBody = AnyShape(Diamond())
        case .rectangle:
            someBody = AnyShape(Rectangle())
        }

        return ZStack {
            someBody.fill().opacity(getOpacity())
            someBody.stroke()
        }
    }
    
    private func getColor () -> Color {
        switch color {
        case .blue:
            return Color.blue
        case .red:
            return Color.red
        case .green:
            return Color.green
        }
    }
    
    private func getOpacity () -> Double {
        switch opacity {
        case .blank:
            return 0.0
        case .filled:
            return 1.0
        case .stripped:
            return 0.2
        }
    }
    
    var body: some View {
        let Body = getBody()
        let color = getColor()

        return Body.foregroundColor(color)
            .frame(minHeight: 10, maxHeight: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    
    
    //MARK: - Controls
    
    let lineWidth: CGFloat = 3.0
}
