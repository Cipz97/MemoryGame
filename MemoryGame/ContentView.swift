//
//  ContentView.swift
//  MemoryGame
//
//  Created by Matteo Cipone on 16.10.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var memoryGameViewModel: MemoryGameViewModel
    var body: some View {
        VStack {
            HStack {
                Text("The Memory Game!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(memoryGameViewModel.cards, content: {
                        card in CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                memoryGameViewModel.chooseCard(card)
                            }
                    })
                }
            }.padding()
            Spacer()
            VStack {
                Text("Score: \(memoryGameViewModel.getScore())")
                    .font(.largeTitle)
                    .padding(.bottom)
                HStack {
                    ButtonVehicles(memoryGameViewModel: memoryGameViewModel)
                    Spacer()
                    ButtonGames(memoryGameViewModel: memoryGameViewModel)
                    Spacer()
                    ButtonAnimals(memoryGameViewModel: memoryGameViewModel)
                }.padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemoryGameViewModel()
        ContentView(memoryGameViewModel: game)
    }
}
//Card Model
struct CardView: View {
    var card: MemoryGame.Card
    var body: some View {
        HStack {
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(.red)
                    Text(card.emoji)
                    .font(.largeTitle)
                } else {
                    RoundedRectangle(cornerRadius: 20)
                        .fill()
                        .foregroundColor(.red)
                }
            }
        }
    }
}
// Game Buttons
struct ButtonGames: View {
    var memoryGameViewModel: MemoryGameViewModel
    var body: some View {
        HStack {
            Button {
                memoryGameViewModel.chooseTheme(Themes.themeEmojis)
            } label: {
                VStack {
                    Image(systemName: "face.smiling.fill")
                    Text("Emojis")
                        .font(.body)
                }
            }
        }
    }
}
struct ButtonVehicles: View {
    var memoryGameViewModel: MemoryGameViewModel
    var body: some View {
        HStack {
            Button {
                memoryGameViewModel.chooseTheme(Themes.themeVehicles)
            } label: {
                VStack {
                    Image(systemName: "car.fill")
                    Text("Vehicles")
                        .font(.body)
                }
            }
        }
    }
}
struct ButtonAnimals: View {
    var memoryGameViewModel: MemoryGameViewModel
    var body: some View {
        HStack {
            Button {
                memoryGameViewModel.chooseTheme(Themes.themeAnimals)
            } label: {
                VStack {
                    Image(systemName: "pawprint.fill")
                    Text("Animals")
                        .font(.body)
                }
            }
        }
    }
}
