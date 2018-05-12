//
//  MemoryGame.swift
//  iOSCesar
//
//  Created by Marlon Chalegre on 14/04/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import Foundation

class MemoryGame {
    
    var cards = [Card]()
    var jogadas: Int = 0
    
    init(numberOfPairs: Int) {
        for _ in 0..<numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
    }
    
    func chooseCard(at index: Int) {
        let cardsUp = cards.indices.filter({ cards[$0].isUp })
        let currentUpCardIndex = cardsUp.count == 1 ? cardsUp.first : nil
        
        if !cards[index].isMatched {
            if let matchIndex = currentUpCardIndex {
                if matchIndex != index && cards[matchIndex].indentifier == cards[index].indentifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    jogadas = jogadas+2
                }else{ 
                    jogadas = jogadas-1
                }
                cards[index].isUp = true
            } else {
                for i in cards.indices {
                    cards[i].isUp = (i == index)
                }
            }
        }
    }
}
