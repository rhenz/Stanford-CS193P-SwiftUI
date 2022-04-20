//
//  EmojiMemoryGame.swift
//  Memorize-Assignment-2
//
//  Created by John Salvador on 4/20/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    // MARK: - Static Properties
    private static let themes: [Theme] = [
        Theme(name: "Animal", emojis: ["🐶", "🐱", "🐹", "🦁"], numberOfPairs: 4, color: .yellow),
        Theme(name: "Vehicle", emojis: ["🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🛩", "🚀", "🛸", "🚁", "🛶", "⛵️", "🚤", "🛥", "🛳", "🚢", "🚗", "🚕", "🚙", "🚌", "🚎"], numberOfPairs: 67, color: .indigo),
        Theme(name: "Food", emojis: ["🥮", "🥐", "🥯", "🍞", "🥖", "🥨", "🧀", "🥞", "🍳", "🍗"], numberOfPairs: 9, color: .red),
        Theme(name: "Sport", emojis: ["🏀", "⚽️", "🏈", "⚾️", "🎾", "🏐", "🏉", "🏏", "🎱", "🏓"], numberOfPairs: 10, color: .green),
        Theme(name: "Smiley", emojis: ["😀", "😄", "😅", "😇", "🥰", "🥳", "🤩", "😎", "🥸"], numberOfPairs: 9, color: .blue),
        Theme(name: "Electronic", emojis: ["📱", "🖥", "🖨", "📟", "📺", "📷", "⌨️", "🕹"], numberOfPairs: 8, color: .yellow)
    ]
    
    // MARK: - Stored Properties
    @Published private(set) var model: MemoryGame<String> = createMemoryGame(theme: themes.randomElement()!)
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    var cardColor: Color {
        switch model.theme.color {
        case .red:
            return .red
        case .blue:
            return .blue
        case .green:
            return .green
        case .yellow:
            return .yellow
        case .cyan:
            return .cyan
        case .indigo:
            return .indigo
        }
    }
    
    var score: Int {
        return model.score
    }
    
    var themeName: String {
        return model.theme.name
    }
    
    // MARK: - Static Methods
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(theme: theme) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    // MARK: - Methods
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        let randomTheme = EmojiMemoryGame.themes.randomElement()!
        self.model = EmojiMemoryGame.createMemoryGame(theme: randomTheme)
    }
    
}
