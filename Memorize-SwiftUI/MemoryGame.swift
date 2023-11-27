//
//  MemoryGame.swift
//  Memorize-SwiftUI
//
//  Created by Thaoly Ngo on 10/12/23.
//

import Foundation

struct MemoryGame<ContentType> where ContentType: Equatable {
    private(set) var cards : Array<Card>
    private var faceUpCardIndex : Int?
    
    init(pairs : Int, makeCardContent: (Int) -> ContentType ) {
        cards = Array<Card>()
        
        for index in 0..<pairs {
            let content = makeCardContent(index)
            cards.append(Card(content: content, id: index*2))
            cards.append(Card(content: content, id: index*2+1))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let cardIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[cardIndex].isFaceUp,
           !cards[cardIndex].isMatched
        {
            if let matchIndex = faceUpCardIndex {
                if cards[matchIndex].content == cards[cardIndex].content {
                    cards[matchIndex].isMatched = true
                    cards[cardIndex].isMatched = true
                }
                faceUpCardIndex = nil
                
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                faceUpCardIndex = cardIndex
            }
            cards[cardIndex].isFaceUp.toggle()
        }
    }
    
    
    struct Card : Identifiable {
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content : ContentType
        var id: Int
    }
}
