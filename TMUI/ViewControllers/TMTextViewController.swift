//
//  TMTextViewController.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/5/7.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import UIKit

open class TMTextViewController: UIViewController {
    @IBOutlet public weak var backgroundImageView: UIImageView!
    @IBOutlet public weak var textView: UITextView!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // These do not work
        self.edgesForExtendedLayout = [];
        self.extendedLayoutIncludesOpaqueBars = true;
        self.automaticallyAdjustsScrollViewInsets = true;
        // Do any additional setup after loading the view.
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.textView.setContentOffset(CGPoint.zero, animated: false)
    }
}
