//
//  ContentView.swift
//  MemGem
//
//  Created by Михаил Красильник on 23.02.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userDataManager: UserDataManager 
    
    @ObservedObject var emojiMemoryGame: EmojiMemoryGame
    var colorIndex: Int
    
    var body: some View {
        VStack {
            Text(emojiMemoryGame.theme)
                .font(.largeTitle)
            HStack {
                Text("Points: \(emojiMemoryGame.points)")
                Spacer()
            }
            .padding()
            Grid(emojiMemoryGame.cards) { card in
                CardView(card: card, colorIndex: colorIndex).onTapGesture {
                    emojiMemoryGame.chosenCard(card: card)
                }
            }
            Button(action: {
                    presentation.wrappedValue.dismiss()
                
            }) {
                Text("Back")
            }
            .font(.title)
        }
        .padding(.top, 40)
        .padding(.bottom, 40)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        .environmentObject(emojiMemoryGame)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiMemoryGame: EmojiMemoryGame(themeIndex: 1), colorIndex: 1)
     
    }
}


struct CardView: View {
    
    var card: MemoryGame<String>.Card
    var colorIndex: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 5)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: 10)
                    }
                }
            }
            .padding()
            .foregroundColor(setColor(index: colorIndex))
            .font(Font.system(size: getSizeForCardContent(with: geometry.size)))
        }
    }
    
    func setColor(index: Int) -> Color {
        let colors = [Color.orange, Color.green, Color.yellow, Color.blue, Color.gray]
        return colors[index]
    }
    
    func getSizeForCardContent(with size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.56
    }
}
