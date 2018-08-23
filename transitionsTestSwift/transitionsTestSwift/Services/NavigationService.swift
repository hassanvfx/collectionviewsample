//
//  TTSNavigation.swift
//  transitionsTestSwift
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

import Foundation
import UIKit

class NavigationService{
    
    var navigationController:UINavigationController?
    
    public func setupWithWindow(window:UIWindow){
        let rootController = RootController()
        self.navigationController = UINavigationController(rootViewController: rootController)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        window.rootViewController=self.navigationController
        window.makeKeyAndVisible()
    }
}
