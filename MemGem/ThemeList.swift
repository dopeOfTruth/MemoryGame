//
//  ThemeList.swift
//  MyOwnSwiftUIApp
//
//  Created by Михаил Красильник on 23.02.2021.
//

import Foundation

struct ThemeList {
    
    var names = ["Halloween", "Animals", "Faces", "Vehicles", "Zodiac signs"]
    
    var emojis = [
        ["🧟‍♂️", "👻", "🧙🏾‍♀️", "🕸", "🍬", "🦇", "💀", "🕷", "🧛🏽‍♂️", "🪦", "😈", "🧛🏾‍♀️"].shuffled(),
        ["🐝", "🐜", "🐒", "🦉", "🐨", "🐴", "🐮", "🦁", "🦆", "🐍", "🐢", "🐌"].shuffled(),
        ["🥳", "🙃", "😀", "😍", "🤓", "🧐", "🤨", "😚", "🥺", "😱", "🤯", "🤫"].shuffled(),
        ["🚎", "🚒", "🚓", "🚂", "🚁", "🛸", "🏍", "🚛", "🏎", "🚕", "🚐", "🛵"].shuffled(),
        ["♈️", "♉️", "♊️", "♋️", "♌️", "♍️", "♎️", "♏️", "♐️", "♑️", "♒️", "♓️"].shuffled()
    ]
    
   
}


enum ThemeIndex: Int {
    case halloween = 0
    case animals = 1
    case faces = 2
    case vehicles = 3
    case zodiac = 4
}

//let color = []
