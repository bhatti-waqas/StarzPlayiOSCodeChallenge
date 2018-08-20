//
//  TVSeasonSelectionHeaderCell.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import UIKit

protocol SeasonSelectionDelegate : class {
    
    func tvSeasonSelected( _ season : TVSeasonAPIModel)
}

class TVSeasonSelectionHeaderCell: UITableViewCell {

    var delegate:SeasonSelectionDelegate?
    var dataSource:[TVSeasonAPIModel]?{
        didSet{
            collectionView.reloadData()
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedIndex: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension TVSeasonSelectionHeaderCell:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "segmentCollectionCellId", for: indexPath) as! SeasonSegmentCollectionViewCell
        if(indexPath.row == selectedIndex){
            cell.setSelected(with: true)
        }
        else{
            cell.setSelected(with: false)
        }
        
        if let data = dataSource{
            let tvSeason = data[indexPath.row]
            if(indexPath.row == data.count - 1 ){
                cell.setSeperatorViewHidden(with: true)
            }
            else{
                cell.setSeperatorViewHidden(with: false)
            }
            cell.config(with: tvSeason.name)
        }
    
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let data = dataSource else {
            return 0
        }
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        collectionView.reloadData()
        guard let data = dataSource else {
            return
        }
        let tvSeason = data[indexPath.row]
        delegate?.tvSeasonSelected(tvSeason)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var floatCount:CGFloat = 0.0
        if let count = dataSource?.count{
            floatCount = CGFloat(count)
        }
        let widht = self.frame.size.width / floatCount
        return CGSize(width: widht, height: 50)
    }
    
}
