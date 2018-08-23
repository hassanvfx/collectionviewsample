//
//  ListItemCell.swift
//  transitionsTestSwift
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

import Foundation
import UIKit

public let kListItemCellIndetifier = "Cell"

class ListItemCell:UICollectionViewCell{
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.purple
        
    }
   
}
