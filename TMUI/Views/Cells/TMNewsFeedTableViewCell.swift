//
//  TMNewsFeedTableViewCell.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/5/6.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import UIKit

public class TMNewsFeedTableViewCell: UITableViewCell {

    @IBOutlet public weak var cardWindow: UIView!
    @IBOutlet public weak var backgroundImageView: UIImageView!
    @IBOutlet public weak var titleLbl: UILabel!
    @IBOutlet public weak var timeLbl: UILabel!
    @IBOutlet public weak var firstBtn: UIButton!
    @IBOutlet public weak var secondBtn: UIButton!
    
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        TMUI.shared.makeRoundCorner(self.firstBtn, radius: 3)
        TMUI.shared.makeRoundCorner(self.secondBtn, radius: 3)
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
