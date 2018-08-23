//
//  ListItem.swift
//  transitionsTestSwift
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

import Foundation
import UIKit

struct ListItem{
    
    var name:String?
    var index:Int?
    
    func loadImage(completion:@escaping (UIImage?)->Void){
        
        if let name=name {
            let image=UIImage(named:name)
            DispatchQueue.main.async {
                completion(image)
            }
        }
        
    }
}
