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
            Grid(gameModel.cards) { card in
                CardView(card: card)
            }
            .padding()
        }
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
