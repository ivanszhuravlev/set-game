//
//  ContentView.swift
//  Play Set
//
//  Created by dtermined on 02.04.2021.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gameModel: GameModelController
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Grid(gameModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        gameModel.choose(card: card)
                    }
    //                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    //                .aspectRatio)
                }
                .padding()
            }
        }
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
