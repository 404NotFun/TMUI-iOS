//
//  Extensions.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/9/7.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func topView() -> UIView? {
        if var topVC = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedVC = topVC.presentedViewController{
                topVC = presentedVC
            }
            return topVC.view
        }else {
            return nil
        }
    }
}
