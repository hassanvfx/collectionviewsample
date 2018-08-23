//
//  ScaleTransition.swift
//  transitionsTestSwift
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

import Foundation
import UIKit

class ScaleTransition: NSObject,UIViewControllerAnimatedTransitioning{
    
    
    public var reversed:Bool = false
    public var originRect:CGRect = .zero
   
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
       return 1
    }
    
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        
        let toController = transitionContext.viewController(forKey: .to)!
        let fromController = transitionContext.viewController(forKey: .from)!
        transitionContext.containerView.addSubview(toController.view)
        
        assert(!self.originRect.isEmpty,"Origin rect must be set")
 
        let scaleTransform = transformToRect(from:toController.view.frame,to:self.originRect)
        
        if(self.reversed){
            //SCALE OUT
            transitionContext.containerView.sendSubview(toBack: toController.view)
       
         
            fromController.view.transform = .identity
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                
               
                fromController.view.transform = scaleTransform
            
            }, completion: { finished in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
            
        }else{
            //SCALE IN
            
            
            toController.view.transform = scaleTransform
            
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                
                toController.view.transform = .identity
                
            }, completion: { finished in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
            
        }

    }
    

    func transformToRect(from:CGRect,to:CGRect)->CGAffineTransform{
        var transform:CGAffineTransform = .identity;
        transform = transform.translatedBy(x: -(from.midX-to.midX), y: -(from.midY-to.midY))
        transform = transform.scaledBy(x: to.size.width/from.size.width, y: to.size.height/from.size.height)
        return transform
    }

}
