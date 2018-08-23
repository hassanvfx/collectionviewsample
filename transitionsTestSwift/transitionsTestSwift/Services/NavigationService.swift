//
//  TTSNavigation.swift
//  transitionsTestSwift
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

import Foundation
import UIKit

class NavigationService: NSObject{
    
    public var nextTransitionInteractive:Bool=false
    
    var navigationController:UINavigationController?
    var interactionController:UIPercentDrivenInteractiveTransition?
    var lastTransitionOriginRect:CGRect?
    
    
    public func setupWithWindow(window:UIWindow){
        let rootController = RootController()
        self.navigationController = UINavigationController(rootViewController: rootController)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.delegate=self
        self.interactionController = UIPercentDrivenInteractiveTransition()
        
        window.rootViewController=self.navigationController
        window.makeKeyAndVisible()
    }
    
    func presentPreviewForListItem(item:ListItem){
        let previewController = ImagePreviewController()
        previewController.setupWithListItem(item)
        self.navigationController?.pushViewController(previewController, animated: true)
    }
    
    func popToRootController(interactive:Bool){
        self.nextTransitionInteractive=interactive
        popToRootController()
    }
    
    func popToRootController(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
}

//MARK: Transitions
extension NavigationService: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let scaleTransition = ScaleTransition()
        scaleTransition.originRect = self.lastTransitionOriginRect!
        
        if fromVC is ImagePreviewController{
            scaleTransition.reversed=true
        }
        return scaleTransition
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?{
        
        if !self.nextTransitionInteractive{ return nil}
        self.nextTransitionInteractive=false
        
        
        return self.interactionController;
    }
    
    
    func updateInteractiveTransition(_ percent:Double){
        self.interactionController?.update(CGFloat(percent))
    }
    
    func finishTransition(completed:Bool){
        if(completed){
            self.interactionController?.finish()
        }else{
            self.interactionController?.cancel()
        }
        
    }
    
    
}

