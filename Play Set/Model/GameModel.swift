//
//  GameModel.swift
//  Play Set
//
//  Created by dtermined on 02.04.2021.
//

import Foundation

struct GameModel {
    private var cards: Array<Card>
    private(set) var playingCards: Array<Card>
    private(set) var chosenIndices: Array<Int>
    
    init() {
        var cards: Array<Card> = []
        
        for num in NumberOfItems.allCases {
            for shape in CardShape.allCases {
                for color in Colors.allCases {
                    for opacity in Opacity.allCases {
                        cards.append(Card(id: cards.count + 1, numberOfItems: num, color: color, opacity: opacity, shape: shape))
                    }
                }
            }
        }
        
        cards.shuffle()
        
        self.cards = Array(cards[initialCardsCount...])
        self.playingCards = Array(cards[..<initialCardsCount])
        self.chosenIndices = []
    }
    
    mutating func addCards() {
        if (cards.count >= additionalCardsCount) {
            playingCards = Array(cards[..<additionalCardsCount])
            cards = Array(cards[additionalCardsCount...])
        }
    }
    
    mutating func chooseCard(_ card: Card) {
        if let index = playingCards.firstIndex(matching: card) {
            playingCards[index].isChosen = true
            
            
            if chosenIndices.count == 2 {
                print("------ GONNA COMPARE CARDS!!!!!")
            }
            
            if chosenIndices.count == 3 {
                for chosenIndex in chosenIndices {
                    playingCards[chosenIndex].isChosen = false
                }
                chosenIndices.removeAll()
            }
            
            chosenIndices.append(index)
        }
    }
    
    
    // MARK: - Controls
    
    let initialCardsCount = 12
    let additionalCardsCount = 3
}
