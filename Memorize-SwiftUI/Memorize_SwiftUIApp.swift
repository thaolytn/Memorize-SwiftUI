//
//  Memorize_SwiftUIApp.swift
//  Memorize-SwiftUI
//
//  Created by Thaoly Ngo on 8/8/23.
//

import SwiftUI

@main
struct Memorize_SwiftUIApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
