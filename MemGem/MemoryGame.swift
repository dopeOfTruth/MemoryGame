//
//  MemoryGame.swift
//  MemGem
//
//  Created by Михаил Красильник on 23.02.2021.
//

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable {
    
    var cards: [Card]
    var points = 0
    
    var intermediateCardIndex: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func chosenCard(card: Card) {
        
        if let chosenIndex = cards.getFirstIndex(matched: card),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            
            if let potentialMatchedIndex = intermediateCardIndex {
                if cards[potentialMatchedIndex].content == cards[chosenIndex].content {
                    cards[potentialMatchedIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    points += 2
                } else {
                    if cards[potentialMatchedIndex].wasSeen && cards[chosenIndex].wasSeen {
                        points -= 1
                    }
                }
                cards[chosenIndex].isFaceUp = true
                cards[chosenIndex].wasSeen = true
            } else {
                intermediateCardIndex = chosenIndex
                cards[chosenIndex].wasSeen = true
            } 
        }
    }
    
    init(namberOfPair: Int, getContentForCard: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<namberOfPair {
            let cardContent = getContentForCard(pairIndex)
            cards.insert(Card(content: cardContent, id: pairIndex * 2), at: Int.random(in: 0...pairIndex))
            cards.insert(Card(content: cardContent, id: pairIndex * 2 + 1), at: Int.random(in: 0...pairIndex + 1))
        }
        
    }
    
    struct Card: Identifiable {
        var wasSeen = false
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
