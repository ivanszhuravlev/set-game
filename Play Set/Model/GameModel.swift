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
    private(set) var chosenCards: Array<Card>
    
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
        self.chosenCards = []
    }
    
    mutating func addCards() {
        if (cards.count >= additionalCardsCount) {
            playingCards = Array(cards[..<additionalCardsCount])
            cards = Array(cards[additionalCardsCount...])
        }
    }
    
    private mutating func unselectAll() {
        for index in 0..<playingCards.count {
            playingCards[index].isChosen = false
        }
        chosenCards.removeAll()
    }
    
    mutating func chooseCard(_ card: Card) {
        if let index = playingCards.firstIndex(matching: card), playingCards[index].isChosen == false {
            if chosenCards.count == 3 {
                unselectAll()
            }
            
            playingCards[index].isChosen = true
            chosenCards.append(playingCards[index])
            
            if chosenCards.count == 3 {
                compareAll()
            }
            
        }
    }
    
    private mutating func compareAll() {
        let shape = compare(by: chosenCards.map { card in
            card.shape
        })
        
        let color = compare(by: chosenCards.map { card in
            card.color
        })
        
        let opacity = compare(by: chosenCards.map { card in
            card.opacity
        })
        
        let number = compare(by: chosenCards.map { card in
            card.numberOfItems
        })
        
        if shape && color && opacity && number {
            chosenCards.forEach { card in
                playingCards = playingCards.filter { playingCard in
                    playingCard.id != card.id
                }
            }
            unselectAll()
        }
    }
    
    private func compare<T: Equatable>(by params: [T]) -> Bool {
        let equal = params[0] == params[1] && params[0] == params[2]
        let unequal = params[0] != params[1] && params[0] != params[2] && params[1] != params[2]
        
        return equal || unequal
    }
    
    // MARK: - Controls
    
    let initialCardsCount = 12
    let additionalCardsCount = 3
}
