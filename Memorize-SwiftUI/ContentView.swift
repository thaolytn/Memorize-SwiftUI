//
//  ContentView.swift
//  Memorize-SwiftUI
//
//  Created by Thaoly Ngo on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var vehicles = ["✈️", "⛵️", "🚁", "🚗", "🚲", "🛴", "🚢", "🚠", "🚖", "🛵", "🚛", "🚔", "🛻", "🦼", "🦯", "🏎️", "🚤" ]
    var animals = ["🐶", "🐱", "🐨", "🐭", "🐷", "🐸", "🐵", "🐤", "🐮", "🦆", "🦉", "🐴", "🦋", "🐛", "🦇", "🐝", "🦄"]
    var plants = ["🌵", "🌲", "🍄", "🌹", "🌸", "🪷", "🌻", "🍁", "🐚", "🌺", "🌾", "🎋", "🍌", "🍇", "🍉", "🍈", "🍎"]
    @State var emojis = ["😀", "🥹", "😇", "😍", "😜", "😎", "🥸", "🤩", "🥶", "🥳", "😭", "😡", "😱", "🫥", "🫠", "🤫", "😶‍🌫️"]
    
    @State var emojiCount = 17
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                let bestWidth = widthThatBestFits(cardCount: emojiCount)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: bestWidth))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fill)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehicleThemeButton
                Spacer()
                animalThemeButton
                Spacer()
                plantThemeButton
            }
        }
        .padding(.horizontal)


    }
    
    var vehicleThemeButton : some View {
        Button {
            emojiCount = Int.random(in: 4...17)
            emojis = vehicles.shuffled()
        } label: {
            VStack {
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("Vehicle")
            }
            
        }
    }
    
    var animalThemeButton : some View {
        Button {
            emojiCount = Int.random(in: 4...17)
            emojis = animals.shuffled()
        } label: {
            VStack {
                Image(systemName: "hare")
                    .font(.largeTitle)
                Text("Animal")
            }
        }
    }
    
    var plantThemeButton : some View {
        Button {
            emojiCount = Int.random(in: 4...17)
            emojis = plants.shuffled()
        } label: {
            VStack {
                Image(systemName: "leaf")
                    .font(.largeTitle)
                Text("Plants")
            }
        }
    }
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        
        var bestWidth = 200
        
        if cardCount > 25 {
            bestWidth = 50
        } else if cardCount > 16 {
            bestWidth = 60
        } else if cardCount > 9 {
            bestWidth = 80
        } else if cardCount > 4 {
            bestWidth = 100
        } else if cardCount > 1 {
            bestWidth = 150
        } else {
            bestWidth = 200
        }
        
        
        return CGFloat(bestWidth)
        
    }
    
}







struct CardView: View {
    let card : MemoryGame<String>.Card // Card is a read-only struct, so make it a constant
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}




















struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
            
    }
}
