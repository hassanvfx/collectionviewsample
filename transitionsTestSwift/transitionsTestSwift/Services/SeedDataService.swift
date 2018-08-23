//
//  SeedData.swift
//  transitionsTestSwift
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

import Foundation

private let LIST_ITEM_RANGE = 1...20
private let LIST_ITEM_MAX_INDEX = 5
class SeedDataService{
    
    public var listItems: [ListItem] {
        
        var result = [ListItem]()
        
        for i in LIST_ITEM_RANGE {
            let index = (i%LIST_ITEM_MAX_INDEX)+1
            let name = "image\(index)"
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
