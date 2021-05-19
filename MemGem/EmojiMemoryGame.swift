//
//  EmojiMemoryGame.swift
//  MemGem
//
//  Created by Михаил Красильник on 23.02.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published var memoryGame: MemoryGame<String> = EmojiMemoryGame.createEmojiMemoryGame()
    
    let themeList = ThemeList()
    var theme: String = ""
    
    
    init(themeIndex: Int) {
        theme = themeList.names[themeIndex]
        memoryGame = MemoryGame(namberOfPair: Int.random(in: 3..<themeList.emojis[themeIndex].count)) { index in themeList.emojis[themeIndex][index]
        }
        
    }
    
    static func createEmojiMemoryGame() -> MemoryGame<String> {
        
        let themeList = ThemeList()
        
        return MemoryGame(namberOfPair: Int.random(in: 3..<themeList.emojis[1].count)) { index in themeList.emojis[1][index] }
    }
    
    var cards: [MemoryGame<String>.Card] {
        memoryGame.cards
    }
    
    var points: Int {
        memoryGame.points
    }
    
    func chosenCard(card: MemoryGame<String>.Card) {
        memoryGame.chosenCard(card: card)
    }
    
}

