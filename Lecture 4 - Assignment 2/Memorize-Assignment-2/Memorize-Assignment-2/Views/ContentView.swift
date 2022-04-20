//
//  ContentView.swift
//  Memorize-Assignment-2
//
//  Created by John Salvador on 4/20/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let columns = [GridItem(.adaptive(minimum: 65))]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(viewModel.cardColor)
            }
            .padding(.horizontal)
            .navigationTitle(viewModel.themeName)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // Start new game with a random theme
                        viewModel.newGame()
                    } label: {
                        Text("New Game")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Score: \(viewModel.score)")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0) // hide the card
            } else {
                shape.fill()
            }
            
        }
        
    }
}
