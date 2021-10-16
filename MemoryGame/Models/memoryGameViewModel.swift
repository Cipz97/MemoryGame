//
//  memoryGameViewModel.swift
//  MemoryGame
//
//  Created by Matteo Cipone on 16.10.21.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    
    
    static func createGame() -> MemoryGame {
        return MemoryGame()
    }
    
    @Published private var model = createGame()
    
    var cards: [MemoryGame.Card] {
        return model.currentTheme
    }
    
    func chooseCard(_ card: MemoryGame.Card) {
        model.isCardMatched(card)
    }
    func chooseTheme(_ theme: [String]) {
        model.createGame(theme: theme)
    }
    func getScore() -> Int {
        model.getScore()
    }
}
