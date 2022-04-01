//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by JLCS on 4/1/22.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🛩", "🚀", "🛸", "🚁", "🛶", "⛵️", "🚤", "🛥", "🛳", "🚢", "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚜", "🚛"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
