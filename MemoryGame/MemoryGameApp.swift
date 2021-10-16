//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Matteo Cipone on 16.10.21.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    let game = MemoryGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(memoryGameViewModel: game)
        }
    }
}
