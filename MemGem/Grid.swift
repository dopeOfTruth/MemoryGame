//
//  Grid.swift
//  MemGem
//
//  Created by Михаил Красильник on 24.02.2021.
//

import SwiftUI

//struct Grid<Item, ItemView>: View where Item: Identifiable , ItemView: View {
//    
//    var items: [Item]
//    var getItemView: (Item) -> ItemView
//    
//    init(_ items: [Item], getItemView: @escaping (Item) -> ItemView) {
//        self.items = items
//        self.getItemView = getItemView
//    }
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let layout = GridLayout(itemCount: items.count, in: geometry.size)
//            ForEach(items) { item in
//                getViewBody(with: item, and: layout)
//            }
//        }
//    }
//    
//    func getViewBody(with item: Item, and layout: GridLayout) -> some View {
//        let index = items.getFirstIndex(matched: item)!
//        return getItemView(item)
//            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
//            .position(layout.location(ofItemAt: index))
//    }
//}

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    var items: [Item]
    var viewFromItem: (Item) -> ItemView
    
    
    
    init(_ items: [Item], viewFromItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewFromItem = viewFromItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            let layout = GridLayout(itemCount: items.count, in: geometry.size)
            ForEach(items) { item in
                returnVeiw(with: item, and: layout)
            }
        }
    }
    
    private func returnVeiw(with item: Item, and layout: GridLayout) -> some View {
        let index = items.getFirstIndex(matched: item)!
        return viewFromItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}
