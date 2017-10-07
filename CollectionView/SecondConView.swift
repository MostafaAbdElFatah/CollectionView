//
//  SecondConView.swift
//  CollectionView
//
//  Created by Mostafa on 7/15/17.
//  Copyright © 2017 Mostafa. All rights reserved.
//

import UIKit

class SecondConView:UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {

    internal var selectedCell:[[String:NSObject]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func Back_brnClicked(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.selectedCell.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:CollViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollViewCell", forIndexPath: indexPath) as! CollViewCell
        cell.label1.text =  self.selectedCell[indexPath.row]["name"]! as? String
        cell.label2.text =  self.selectedCell[indexPath.row]["age"]! as? String
        cell.imageCell.image = UIImage(named: self.selectedCell[indexPath.row]["image"] as! String)
        return cell
    }
    
}
