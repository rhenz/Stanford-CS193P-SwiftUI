//
//  ContentView.swift
//  Memorize-Assignment-1
//
//  Created by JLCS on 3/24/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    let themeSelectionDictionary = [
        "Vehicle": Image(systemName: "car.fill"),
        "Food": Image(systemName: "lungs.fill"),
        "Animal": Image(systemName: "hare.fill")
    ]
    
    let themes = ["Vehicle", "Food", "Animal"]
    
    let vehicles = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜" , "🛴", "🚲", "🛵", "🏍", "🛺", "🚔"]
    let foods = ["🍏", "🍎", "🍐", "🥖", "🥨", "🧀", "🍗", "🍖", "🌭", "🍔", "🍟", "🍕", "🫓", "🥪", "🥙", "🧆", "🌮", "🌯", "🫔"]
    let animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐷", "🐮", "🐵", "🐗", "🐴", "🦉", "🐔", "🐧"]
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State var contents: [String]
    
    
    // MARK: - Init
    init() {
        self.contents = self.vehicles
    }
    
    // MARK: - View
    var body: some View {
        VStack {
            Text("Memorize!") // Title
                .font(.largeTitle)
            
            ScrollView { // Cards in Grid View
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(contents, id: \.self) { content in
                        Card(content: content)
                    }
                }
            }
            
            Spacer()
            
            HStack(spacing: 20) { // Theme Choosing Buttons
                ForEach(themes, id: \.self) { theme in
                    ThemeChoosingButton(action: {
                        
                        if theme == "Vehicle" {
                            self.contents = vehicles.shuffled()
                        } else if theme == "Food" {
                            self.contents = foods.shuffled()
                        } else {
                            self.contents = animals.shuffled()
                        }
                    }, themeImage: themeSelectionDictionary[theme]!, title: theme
                )}
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Mini"))
            .previewInterfaceOrientation(.portrait)
    }
}

struct Card: View {
    var content: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(lineWidth: 3)
                .foregroundColor(.red)
            
            Text(content)
                .font(.largeTitle)
        }
        .frame(height: 100)
    }
}


struct ThemeChoosingButton: View {
    
    var action: () -> Void
    var themeImage: Image
    var title: String
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                themeImage
            }
            .font(.largeTitle)
            
            Text(title)
                .foregroundColor(.blue)
                .font(.caption)
        }
        
    }
}
