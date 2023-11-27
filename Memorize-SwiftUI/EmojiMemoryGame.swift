//
//  EmojiMemoryGame.swift
//  Memorize-SwiftUI
//
//  Created by Thaoly Ngo on 10/12/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["😀", "🥹", "😇", "😍", "😜", "😎", "🥸", "🤩", "🥶", "🥳", "😭", "😡", "😱", "🫥", "🫠", "🤫", "😶‍🌫️"]
    
    @Published private var model : MemoryGame<String> = MemoryGame(pairs: 4) { pairIndex in
        emojis[pairIndex]
    }
    
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        // objectWillChange.send()
        model.choose(card)
    }
}
