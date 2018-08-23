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
    
    var didTouch : (() -> Void)?
    var listItem:ListItem?
    
    lazy var imageDisplay:ImageDisplay = {
      
        let imageDisplay=ImageDisplay()
//        imageDisplay.backgroundColor=UIColor.blue
        self.addSubview(imageDisplay)
        
        imageDisplay.didTouch = {
            if let didTouch = self.didTouch {
                didTouch()
            }
        }
        
        return imageDisplay
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor=UIColor.purple
        
    }
   
    override func layoutSubviews() {
        self.imageDisplay.frame=self.bounds
    }
}

//MARK: Data Display
extension ListItemCell{
    
    func setupWithListItem(_ item:ListItem){
        self.listItem=item
        
        self.listItem?.loadImage(completion: { (image) in
            if let image=image{
                self.imageDisplay.setupWithImage(image)
            }
            
        })
    }
}
