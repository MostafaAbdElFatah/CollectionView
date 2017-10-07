//
//  ViewController.swift
//  CollectionView
//
//  Created by Mostafa on 7/15/17.
//  Copyright © 2017 Mostafa. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {

    var selectedIndex:[Int] = []
    var viewCellData = [
         ["name":"asd1","age":"45","image":"01","selected":false]
        ,["name":"asd2","age":"30","image":"08","selected":false]
        ,["name":"asd3","age":"42","image":"02","selected":false]
        ,["name":"asd4","age":"28","image":"13","selected":false]
        ,["name":"asd5","age":"35","image":"03","selected":false]
        ,["name":"asd6","age":"22","image":"12","selected":false]
        ,["name":"asd7","age":"30","image":"04","selected":false]
        ,["name":"asd8","age":"20","image":"11","selected":false]
        ,["name":"asd9","age":"45","image":"05","selected":false]
        ,["name":"asd10","age":"27","image":"10","selected":false]
        ,["name":"asd11","age":"45","image":"06","selected":false]
        ,["name":"asd12","age":"26","image":"09","selected":false]
        ,["name":"asd13","age":"45","image":"07","selected":false]
        ,["name":"asd14","age":"25","image":"14","selected":false]
        ,["name":"asd15","age":"18","image":"15","selected":false]
        ,["name":"asd16","age":"24","image":"16","selected":false]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SelectedCell_btnClicked(sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle:NSBundle.mainBundle())
        let secdViewCon:SecondConView  = mainStoryboard.instantiateViewControllerWithIdentifier("SecondConView") as! SecondConView
        for i in 0..<self.viewCellData.count{
            if (self.viewCellData[i]["selected"] as! Bool){
                secdViewCon.selectedCell.append(self.viewCellData[i])
            }
        }
        self.presentViewController(secdViewCon, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewCellData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:CollViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollViewCell", forIndexPath: indexPath) as! CollViewCell
        cell.label1.text =  self.viewCellData[indexPath.row]["name"]! as? String
        cell.label2.text =  self.viewCellData[indexPath.row]["age"]! as? String
        cell.imageCell.image = UIImage(named: self.viewCellData[indexPath.row]["image"] as! String)
        if self.selectedIndex.contains(indexPath.row){
            cell.SelectionView.hidden = false
        }else{
            cell.SelectionView.hidden = true
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if self.selectedIndex.contains(indexPath.row) {
            self.viewCellData[indexPath.row]["selected"] = false
            //self.selectedIndex = self.selectedIndex.filter(){$0 != indexPath.row}
            self.selectedIndex.removeAtIndex(self.selectedIndex.indexOf(indexPath.row)!)
        }else{
            self.viewCellData[indexPath.row]["selected"] = true
            self.selectedIndex.append(indexPath.row)
        }
        collectionView.reloadData()
        
    }
    
    
}

