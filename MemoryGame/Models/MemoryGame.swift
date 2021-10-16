//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Matteo Cipone on 16.10.21.
//

import Foundation

struct MemoryGame {
    // current theme game starts with the choice of picking your theme 
    var currentTheme: [Card] = []

    var score = 0
    // used to remember index of already face up card
    var indexOfFaceupCard: Int?
    // initialises a theme for the memory game
    mutating func createGame(theme: [String]) {
        currentTheme = []
        var id = 0
        let shuffledTheme = theme.shuffled()
        for emoji in 0..<8 {
            currentTheme.append(Card(id: id*2, emoji: shuffledTheme[emoji]))
            currentTheme.append(Card(id: id*2+1, emoji: shuffledTheme[emoji]))
            id += 1
        }
        currentTheme.shuffle()
    }
    // flips up card and checks if there is a match if true removes matched pair and increases score by 1
    mutating func isCardMatched(_ card: Card) {
        if let chosenCard = currentTheme.firstIndex(where: {$0.id == card.id}), !currentTheme[chosenCard].isFaceUp, !currentTheme[chosenCard].isMatched {
            if let potentialMatch = indexOfFaceupCard {
                if currentTheme[chosenCard].emoji == currentTheme[potentialMatch].emoji {
                    currentTheme[chosenCard].isMatched = true
                    currentTheme[potentialMatch].isMatched = true
                    score += 1
                }
                indexOfFaceupCard = nil
            } else {
                for i in 0..<currentTheme.count {
                    if !currentTheme[i].isMatched {
                        currentTheme[i].isFaceUp = false
                    }
                }
                indexOfFaceupCard = chosenCard
            }
            currentTheme[chosenCard].isFaceUp.toggle()
        }
    }
    // returns the current score of the game
    func getScore() -> Int {
        return score
    }
    
    struct Card: Identifiable {
        var id: Int
        let emoji: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
    
}


let themeOne: [String] = ["🚗","🚌","🚑","🚜","🛴","🚲","🚔","🛺","🚘","🚃","🚄","🚠","🚅","✈️","🚀","🛸","🚁","🛶","🚤","🚢","🛳","🚓","🚛","🛵"]
let themeTwo: [String] = []
let themeThree: [String] = []
