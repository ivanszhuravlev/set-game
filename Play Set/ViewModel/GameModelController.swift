//
//  GameModelController.swift
//  Play Set
//
//  Created by dtermined on 02.04.2021.
//

import Foundation
import SwiftUI

class GameModelController: ObservableObject {
    @Published private var game: GameModel = GameModel()
    
    //MARK: - Access to the Model
    
    var cards: Array<Card> {
        game.playingCards
    }

}
