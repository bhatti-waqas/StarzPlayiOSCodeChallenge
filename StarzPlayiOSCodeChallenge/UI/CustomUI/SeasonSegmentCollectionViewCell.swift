//
//  SeasonSegmentCollectionViewCell.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 19/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import UIKit

class SeasonSegmentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var selectedView: UIView!
    
    @IBOutlet weak var seperatorView: UIView!
    func config(with title:String?) {
        titleLabel.text = title
    }
    func setSelected(with hidden:Bool) {
        selectedView.isHidden = !hidden
    }
    func setSeperatorViewHidden(with hidden:Bool){
        seperatorView.isHidden = hidden
    }
}
