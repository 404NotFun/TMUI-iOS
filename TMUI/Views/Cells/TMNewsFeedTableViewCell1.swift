//
//  TMNewsFeedTableViewCell1.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/6/29.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import UIKit

public class TMNewsFeedTableViewCell1: UITableViewCell {
    @IBOutlet public weak var backgroundImageView: UIImageView!
    @IBOutlet public weak var titleLbl: UILabel!
    @IBOutlet public weak var timeLbl: UILabel!
    @IBOutlet public weak var firstBtn: UIButton!
    @IBOutlet public weak var secondBtn: UIButton!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
