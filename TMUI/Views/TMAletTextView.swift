//
//  TMAletView.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/9/7.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import Foundation

public class TMAlertTextView {
    public static let shared = TMAlertTextView()
    public let alertTextView: TMAlertTextViewInterface!
    let ALERT_X: CGFloat!
    let ALERT_Y: CGFloat!
    let ALERT_WIDTH: CGFloat = 270
    let ALERT_HEIGHT: CGFloat = 200
    
    required public init() {
        ALERT_X = (UIScreen.main.bounds.width - ALERT_WIDTH)/2
        ALERT_Y = (UIScreen.main.bounds.height - ALERT_HEIGHT)/2
        let frame = CGRect.init(x: ALERT_X, y: ALERT_Y, width: ALERT_WIDTH, height: ALERT_HEIGHT)
        alertTextView = TMAlertTextViewInterface.init(frame: frame)
    }
    
    public func setSubtitleText(_ text: String?) {
        self.alertTextView.subtitleLbl.text = text ?? ""
    }
    
    public func setTitleText(_ text: String?) {
        self.alertTextView.titleLbl.text = text ?? ""
    }
    
    public func setContentText(_ text: String?) {
        self.alertTextView.textView.text = text
    }
    
    public func text() -> String? {
        return self.alertTextView.textView.text
    }
    
    public func show(title: String? = nil, subtitle: String? = nil, content: String? = nil, action: @escaping ()->()) {
        setTitleText(title)
        setSubtitleText(subtitle)
        setContentText(content)
        self.alertTextView.action = action
        self.alertTextView.show()
    }
}
