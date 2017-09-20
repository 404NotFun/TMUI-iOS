//
//  TMPickerView.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/8/28.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

//
//  TMUI.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/5/7.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import Foundation
import UIKit

public class TMPickerView {
    public static let shared = TMPickerView()
    public var pickerContainer = UIView()
    public var picker = UIPickerView()
    public let titleLbl = UILabel()
    public let cancelButton = UIButton()
    public let doneButton = UIButton()
    public var action = {}
    let TOOL_BAR_HEIGHT: CGFloat = 35
    let PICKER_WIDTH = UIScreen.main.bounds.size.width
    let PICKER_HEIGHT: CGFloat = 320*0.6
    let CONTAINER_HEIGHT: CGFloat = 320*0.6 + 35
    public var selectedValue: String?
    public var rowsData = [String]()
    public var rowsAny = [Any]()
    var topView: UIView?
    
    required public init() {
        pickerContainer.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height+CONTAINER_HEIGHT, width: PICKER_WIDTH, height: CONTAINER_HEIGHT)
        pickerContainer.backgroundColor = .white
        picker.frame = CGRect(x: 0.0, y: TOOL_BAR_HEIGHT, width: PICKER_WIDTH, height: PICKER_HEIGHT)
        
        pickerContainer.addSubview(picker)
        
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        cancelButton.setTitleColor(.blue, for: .normal)
        cancelButton.backgroundColor = UIColor.groupTableViewBackground
        cancelButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        cancelButton.frame = CGRect(x: 0, y: 0, width: PICKER_WIDTH/3, height: TOOL_BAR_HEIGHT)
        
        titleLbl.text = "請選擇"
        titleLbl.font = UIFont.systemFont(ofSize: 12)
        titleLbl.frame = CGRect(x: PICKER_WIDTH/3, y: 0, width: PICKER_WIDTH/3, height: TOOL_BAR_HEIGHT)
        titleLbl.backgroundColor = .groupTableViewBackground
        titleLbl.textColor = .black
        titleLbl.textAlignment = .center
        
        doneButton.setTitle("完成", for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        doneButton.setTitleColor(.red, for: .normal)
        doneButton.backgroundColor = UIColor.groupTableViewBackground
        doneButton.addTarget(self, action: #selector(dismissWithAction), for: .touchUpInside)
        doneButton.frame = CGRect(x: 2*PICKER_WIDTH/3, y: 0, width: PICKER_WIDTH/3, height: TOOL_BAR_HEIGHT)
        
        pickerContainer.addSubview(titleLbl)
        pickerContainer.addSubview(cancelButton)
        pickerContainer.addSubview(doneButton)
    }
    
    public func setTitleText(_ text: String) {
        self.titleLbl.text = text
    }
    
    public func setCancelBtn(title: String?, titleColor: UIColor?, backgroundColor: UIColor?) {
        if title != nil {
            self.cancelButton.setTitle(title, for: .normal)
        }
        if titleColor != nil {
            self.cancelButton.setTitleColor(titleColor, for: .normal)
        }
        if backgroundColor != nil {
            self.cancelButton.backgroundColor = backgroundColor
        }
    }
    
    public func show(_ vc: UIViewController? = nil) {
        topView = TMUI.shared.getTopView()
        UIView.animate(withDuration: 0.4, animations: {
            var frame:CGRect = self.pickerContainer.frame
            frame.origin.y = UIScreen.main.bounds.size.height - self.CONTAINER_HEIGHT
            self.pickerContainer.frame = frame
            if vc != nil {
                vc?.view.addSubview(self.pickerContainer)
            }else {
                self.topView?.addSubview(self.pickerContainer)
            }
            
        })
    }
    
    @objc private func dismiss() {
        UIView.animate(withDuration: 0.4, animations: {
            self.pickerContainer.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height+self.CONTAINER_HEIGHT, width: self.PICKER_WIDTH, height: self.CONTAINER_HEIGHT)
        })
    }
    
    @objc private func dismissWithAction() {
        UIView.animate(withDuration: 0.4, animations: {
            self.pickerContainer.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height+self.CONTAINER_HEIGHT, width: self.PICKER_WIDTH, height: self.CONTAINER_HEIGHT)
        })
        action()
    }
    
}
