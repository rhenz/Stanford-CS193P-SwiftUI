//
//  Memorize_Assignment_2App.swift
//  Memorize-Assignment-2
//
//  Created by John Salvador on 4/20/22.
//

import SwiftUI

@main
struct Memorize_Assignment_2App: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
