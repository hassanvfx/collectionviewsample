//
//  ImagePreviewController.swift
//  transitionsTestSwift
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

import Foundation
import UIKit

private let MINIMUM_SCALE_TO_TRANSITION = 0.5

class ImagePreviewController: UIViewController{
    
    lazy var imageDisplay:ImageDisplay = {
        let imageDisplay=ImageDisplay()
//        imageDisplay.backgroundColor=UIColor.blue
        self.view.addSubview(imageDisplay)
        
        imageDisplay.didTouch = {
            Services.navigation.popToRootController()
        }
        
        return imageDisplay
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        
        self.addGestures()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        self.imageDisplay.frame=self.view.bounds
    }
    
    func setupWithListItem(_ item:ListItem){
        
        item.loadImage { (image) in
            if let image=image{
                self.imageDisplay.setupWithImage(image)
            }
        }
    }
    
}

//MARK: Gesture
extension ImagePreviewController{
    
    func addGestures(){
        let pinch = UIPinchGestureRecognizer()
        pinch.addTarget(self, action: #selector(didPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func didPinch(_ gesture:UIPinchGestureRecognizer){
        
        if gesture.numberOfTouches != 2{
            return
        }
        
        switch gesture.state {
            
        case.possible:
            return
        case .began:
            self.startTransition()
        case .changed:
            self.applyTransition(scale: Double(gesture.scale))
        case.ended:
            let completed = (Double(gesture.scale) < MINIMUM_SCALE_TO_TRANSITION)
            self.finishTransition(completed: completed)
            return
        case .failed, .cancelled:
            self.finishTransition(completed: false)
            return
        
        }
    }
    
    func startTransition(){
        Services.navigation.popToRootController(interactive: true)
    }
    
    func finishTransition(completed:Bool){
        Services.navigation.finishTransition(completed: completed)
    }
    
    func applyTransition(scale:Double){
        
        var percent = min(max(scale, 0), 1)
        percent=1.0-scale
        print("percent = \(percent)")
        Services.navigation.updateInteractiveTransition(percent)
    }
    
    
    
    //-(void)startTranstion{
    //
    //    [[IVServices navigation]presentRootControllerWithInteractivity];
    //}
    //
    //-(void)finishTransition:(BOOL)completed{
    //    [[IVServices navigation] finishTransition:completed];
    //}
    //
    //-(void)applyScale:(float)scale{
    //
    //    self.currentScale=scale;
    //
    //    float percent=MIN(MAX(scale,0.0),1.0);
    //    percent=1.0-scale;
    //    NSLog(@"scale %f",percent);
    //    [[IVServices navigation]updateInteractiveTransition:percent];
    //}
}
