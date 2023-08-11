//
//  ContentView.swift
//  Memorize-SwiftUI
//
//  Created by Thaoly Ngo on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    
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
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojiCount)))]) {
                    
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fill)
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
    @State var isFaceUp : Bool = true
    var content : String
     
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}





























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        
        ContentView()
            .preferredColorScheme(.light)
            
    }
}
