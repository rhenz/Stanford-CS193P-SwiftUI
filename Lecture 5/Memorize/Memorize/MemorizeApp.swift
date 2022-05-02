//
//  MemorizeApp.swift
//  Memorize
//
//  Created by JLCS on 3/17/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
