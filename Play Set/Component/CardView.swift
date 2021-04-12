//
//  Card.swift
//  Play Set
//
//  Created by dtermined on 12.04.2021.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            content()
        }
        .padding(10)
    }
    
    func content () -> some View {
        VStack {
            ForEach(0..<card.getNumberOfItemsAsInt()) {_ in
                Figure(color: card.color, shape: card.shape, opacity: card.opacity)
            }
        }
        .padding()
    }
    
    
    //MARK: - Controls
    
    let cornerRadius: CGFloat = 12.0
    
}

