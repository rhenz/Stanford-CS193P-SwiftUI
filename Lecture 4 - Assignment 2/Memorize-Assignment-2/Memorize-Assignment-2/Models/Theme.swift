//
//  Theme.swift
//  Memorize-Assignment-2
//
//  Created by John Salvador on 4/20/22.
//

import Foundation


/*
enum Theme: String {
    case vehicle = "Vehicle"
    case food = "Food"
    case sport = "Sport"
    case animal = "Animal"
    case smiley = "Smiley"
    case electronic = "Electronic"
    
    
    var name: String {
        return self.rawValue
    }
    
    var emojis: [String] {
        switch self {
        case .vehicle:
            return ["🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🛩", "🚀", "🛸", "🚁", "🛶", "⛵️", "🚤", "🛥", "🛳", "🚢", "🚗", "🚕", "🚙", "🚌", "🚎"].shuffled()
        case .food:
            return ["🥮", "🥐", "🥯", "🍞", "🥖", "🥨", "🧀", "🥞", "🍳", "🍗"].shuffled()
        case .sport:
            return ["🏀", "⚽️", "🏈", "⚾️", "🎾", "🏐", "🏉", "🏏", "🎱", "🏓"].shuffled()
        case .animal:
            return ["🐶", "🐱", "🐹", "🦁"].shuffled()
        case .smiley:
            return ["😀", "😄", "😅", "😇", "🥰", "🥳", "🤩", "😎", "🥸"].shuffled()
        case .electronic:
            return ["📱", "🖥", "🖨", "📟", "📺", "📷", "⌨️", "🕹"].shuffled()
        }
    }
    
    var numberOfPairs: Int {
        switch self {
        case .sport:
            return (self.emojis.count - 3)
        default:
            return self.emojis.count
        }
    }
    
    var color: Color {
        switch self {
        case .vehicle:
            return .yellow
        case .food:
            return .red
        case .sport:
            return .blue
        case .animal:
            return .green
        case .smiley:
            return .cyan
        case .electronic:
            return .indigo
        }
    }
    
    func getRandomNumberOfPairs() -> Int {
        return Int.random(in: 2..<self.emojis.count)
    }
    
    enum Color {
        case red
        case blue
        case green
        case yellow
        case cyan
        case indigo
    }
}
*/

struct Theme {
    private(set) var name: String
    private(set) var emojis: [String]
    private(set) var numberOfPairs: Int
    private(set) var color: Color
    
    enum Color {
        case red
        case blue
        case green
        case yellow
        case cyan
        case indigo
    }
    
    // MARK: - Methods
    init(name: String, emojis: Set<String>, numberOfPairs: Int, color: Color) {
        self.name = name
        self.emojis = Array(emojis)
        self.numberOfPairs = numberOfPairs > emojis.count ? emojis.count : numberOfPairs
        self.color = color
    }
    
}


