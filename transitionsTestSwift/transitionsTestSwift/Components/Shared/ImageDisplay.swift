//
//  ImageDisplay.swift
//  transitionsTestSwift
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

import Foundation
import UIKit

class ImageDisplay : UIView {
    
    var didTouch : (() -> Void)?
    
    lazy var imageView : UIImageView = {
        //        _ima
        let imageView=UIImageView()
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        
        var tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(self.didTap(_:)))
        self.addGestureRecognizer(tap)
        
        return imageView
    }()
    
    @objc fileprivate func didTap(_ recogizer:UITapGestureRecognizer){
        
        if let didTouch = self.didTouch {
            didTouch()
        }
    }
    
    override func layoutSubviews() {
        self.imageView.frame=self.bounds
    }
    
    func setupWithImage(_ image:UIImage){
        
        DispatchQueue.main.async {
            self.imageView.image=image
        }
    }
}
