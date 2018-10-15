
import UIKit

class SecondConView:UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {

    internal var selectedCell:[[String:NSObject]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func back_brnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.selectedCell.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:CollViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollViewCell", for: indexPath) as! CollViewCell
        cell.label1.text =  self.selectedCell[indexPath.row]["name"]! as? String
        cell.label2.text =  self.selectedCell[indexPath.row]["age"]! as? String
        cell.imageCell.image = UIImage(named: self.selectedCell[indexPath.row]["image"] as! String)
        return cell
    }
    
}
