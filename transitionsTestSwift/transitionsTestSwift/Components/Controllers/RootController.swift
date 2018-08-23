//
//  ViewController.swift
//  transitionsTestSwift
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

import UIKit

class RootController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.red
        self.setupCollectionView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
// MARK: - UICollectionView Setup
extension RootController{
    
    
    func setupCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
       
        let collectionView=UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.register(ListItemCell.self, forCellWithReuseIdentifier: kListItemCellIndetifier)
        collectionView.backgroundColor=UIColor.green
        collectionView.dataSource=self
        collectionView.delegate=self
        
        self.view.addSubview(collectionView)
        self.collectionView = collectionView
        
    }
}


// MARK: - UICollectionViewDataSource
extension RootController {
    //1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kListItemCellIndetifier,
                                                      for: indexPath)
        
        // Configure the cell
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RootController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size=self.view.bounds.size.width/2
        return CGSize(width: size, height: size)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}


