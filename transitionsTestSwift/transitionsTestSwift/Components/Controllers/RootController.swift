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
        self.view.backgroundColor=UIColor.white
        self.setupCollectionView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}
// MARK: - UICollectionView Setup
extension RootController{
    
    
    func setupCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        
        let collectionView=UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.register(ListItemCell.self, forCellWithReuseIdentifier: kListItemCellIndetifier)
        collectionView.backgroundColor=UIColor.clear
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
        return currentItems().count
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:ListItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: kListItemCellIndetifier,
                                                                   for: indexPath) as! ListItemCell
        
        if let item = itemForIndex(indexPath.row) {
            {
                [weak self, cell] in
                
                cell.setupWithListItem(item)
                cell.didTouch={
                    self?.didTapCell(cell: cell)
                }
                
                }()
        }
        
        
        
        // Configure the cell
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RootController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.bounds.size.width/2, height: self.view.bounds.size.height/2)
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


// MARK: - Data Adapter
extension RootController {
    
    func currentItems()->[ListItem]{
        return Services.seed.listItems
    }
    
    func itemForIndex(_ index:Int)->ListItem?{
        let items = currentItems()
        if index >= items.count{
            return nil
        }
        return items[index]
    }
    
}


// MARK: - Touch Responder
extension RootController {
    
    func didTapCell(cell:ListItemCell){
        
       
        let rect = cell.superview?.convert(cell.frame, to: self.view)
        Services.navigation.lastTransitionOriginRect = rect

        if let item = cell.listItem{
            Services.navigation.presentPreviewForListItem(item:item)
        }
    }
    
}



