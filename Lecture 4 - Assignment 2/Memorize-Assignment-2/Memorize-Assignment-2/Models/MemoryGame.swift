//
//  MemoryGame.swift
//  Memorize-Assignment-2
//
//  Created by John Salvador on 4/20/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card]
    private var indexOfTheOneAndOnlyFaceUpCard: Int? // for game logic
    private(set) var theme: Theme
    private(set) var score: Int = 0
    
    
    // MARK: - Init
    init(theme: Theme, cardContentFactory: (Int) -> CardContent) {
        self.theme = theme
        cards = [Card]()
        
        for pairIndex in 0..<theme.numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        
        cards.shuffle()
    }
    
    // MARK: - Methods
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
              !cards[chosenIndex].isFaceUp, // Not faced up
              !cards[chosenIndex].isMatched // Not yet matched
        else {
            return
        }
        
        
        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                
                score += 2
            } else {
                // Mismatch
                if cards[chosenIndex].isPreviouslySeen {
                    if score > 0 { score -= 1 }
                }
            }
            
            indexOfTheOneAndOnlyFaceUpCard = nil
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
        
        cards[chosenIndex].isFaceUp.toggle()
        cards[chosenIndex].isPreviouslySeen = true
    }
    
    
    // MARK: - Card
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isPreviouslySeen: Bool = false
        var content: CardContent
    }
}
