//
//  Array + extension.swift
//  MemGem
//
//  Created by Михаил Красильник on 23.02.2021.
//

import Foundation

extension Array where Element: Identifiable {
    
    func getFirstIndex(matched element: Element) -> Int? {
        for index in self.indices {
            if self[index].id == element.id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    
    var only: Element? {
        count == 1 ? first : nil
    }
}
