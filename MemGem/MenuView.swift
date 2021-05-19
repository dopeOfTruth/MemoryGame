//
//  MenuView.swift
//  MemGem
//
//  Created by Михаил Красильник on 24.02.2021.
//

import SwiftUI

struct MenuView: View {
    
    @State private var openMyView = false
    @ObservedObject var userDataManager = UserDataManager()
    
    var themeList = ThemeList()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                createButton(index: ThemeIndex.halloween.rawValue)
                createButton(index: ThemeIndex.animals.rawValue)
                createButton(index: ThemeIndex.faces.rawValue)
                createButton(index: ThemeIndex.vehicles.rawValue)
                createButton(index: ThemeIndex.zodiac.rawValue)
                
                HStack {
                    Text("Number of points: \(userDataManager.points)")
                    Spacer()
                    Button("Records") {
                        
                    }
                    .padding()
                }
                .font(Font.system(size: 20))
                Spacer()
            }
            .padding()
            .padding(.top, 40)
            .navigationBarTitle("Memory Game")
            .environmentObject(userDataManager)
        }
        
    }
    
    func createButton(index: Int) -> some View {
        NavigationLink(
            destination: EmojiMemoryGameView(emojiMemoryGame: EmojiMemoryGame(themeIndex: index), colorIndex: index),
            label: {
                VStack(spacing: 8) {
                    Text(themeList.names[index])
                        .font(.title)
                    Text(createEmojisString(index))
                        .font(Font.system(size: 25))
                }
            })
    }
    
    func createEmojisString(_ index: Int) -> String {
        
        let emojis = themeList.emojis[index]
        var emojisString = ""
        
        for emoji in emojis {
            emojisString += emoji
        }
        return emojisString
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}



