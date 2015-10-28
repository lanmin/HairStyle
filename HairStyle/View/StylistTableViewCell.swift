//
//  StylistTableViewCell.swift
//  HairStyle
//
//  Created by mac on 15/10/27.
//  Copyright © 2015年 bearapp. All rights reserved.
//

import UIKit

class StylistTableViewCell: UITableViewCell {
    @IBOutlet var collectionV:UICollectionView?
    @IBOutlet var collectionWidth:NSLayoutConstraint?
    @IBOutlet var collectionHeight:NSLayoutConstraint?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "StylistCollectionViewCell", bundle: nil)
        collectionV?.registerNib(nib, forCellWithReuseIdentifier: "StylistCollection")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
