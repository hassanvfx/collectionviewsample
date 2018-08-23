//
//  SeedData.swift
//  transitionsTestSwift
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

import Foundation

private let LIST_ITEM_RANGE = 1...5

class SeedDataService{
    
    public var listItems: [ListItem] {
        
        var result = [ListItem]()
        
        for i in LIST_ITEM_RANGE {
            let name = "image\(i)"
            result.append(listItemFrom(name))
        }
        
        return result
    }
    
    func listItemFrom(_ name: String)->ListItem{
        var item = ListItem()
        item.name=name
        return item
    }
}
