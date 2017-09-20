//
//  TMUIFavoritesSelectionCollectionViewCell.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/4/24.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import UIKit

public class TMUIFavoritesSelectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak public var cardWindow: UIView!
    @IBOutlet weak public var profileImageView: UIImageView!
    @IBOutlet weak public var titleLbl: UILabel!
    @IBOutlet weak public var descriptionTextView: UITextView!
    @IBOutlet weak public var selectionBtn: UIButton!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
