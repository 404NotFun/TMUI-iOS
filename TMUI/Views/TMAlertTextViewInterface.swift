//
//  TMAlertTextView.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/9/7.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import Foundation
import UIKit

public class TMAlertTextViewInterface: UIView {
    @IBOutlet public var contentView: UIView!
    @IBOutlet public weak var titleLbl: UILabel!
    @IBOutlet public weak var subtitleLbl: UILabel!
    @IBOutlet public weak var textView: UITextView!
    @IBOutlet public weak var cancelBtn: UIButton!
    @IBOutlet public weak var confirmBtn: UIButton!
    
    var topView: UIView?
    var coverView: UIView!
    var action = {}
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let bundle = Bundle.init(for: TMAlertTextViewInterface.self)
        bundle.loadNibNamed("TMAlertTextViewInterface", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.coverView = UIView.init(frame: UIScreen.main.bounds)
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.cancelBtn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        self.confirmBtn.addTarget(self, action: #selector(dismissWithAction), for: .touchUpInside)
        
        TMUI.shared.makeBorder(textView, borderWidth: 1, borderColor: UIColor.groupTableViewBackground.cgColor)
        TMUI.shared.makeRoundCorner(contentView, radius: 5)
        TMUI.shared.makeClickable(coverView, target: self, selector: #selector(dismissKeyBoard))
    }
    
    public func show() {
        topView = TMUI.shared.getTopView()
        UIView.animate(withDuration: 0.4, animations: {
            var frame: CGRect = self.frame
            frame.origin.y = UIScreen.main.bounds.size.height/2 - self.frame.height
            self.frame = frame
            self.topView?.addSubview(self.coverView)
            self.topView?.addSubview(self)
        })
    }
    
    @objc private func dismiss() {
        dismissKeyBoard()
        UIView.animate(withDuration: 0.4, animations: {
            self.coverView.removeFromSuperview()
            self.frame = CGRect(x: self.frame.origin.x, y: UIScreen.main.bounds.size.height, width: self.frame.width, height: self.frame.height)
        })
    }
    
    @objc private func dismissWithAction() {
        dismissKeyBoard()
        UIView.animate(withDuration: 0.4, animations: {
            self.coverView.removeFromSuperview()
            self.frame = CGRect(x: self.frame.origin.x, y: UIScreen.main.bounds.size.height, width: self.frame.width, height: self.frame.height)
        })
        action()
    }
    
    @objc private func dismissKeyBoard() {
        topView?.endEditing(true)
    }
}
