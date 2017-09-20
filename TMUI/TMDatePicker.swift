//
//  TMUI.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/5/7.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import Foundation
import UIKit

public class TMDatePicker {
    public static let shared = TMDatePicker()
    public var pickerContainer = UIView()
    public var picker = UIDatePicker()
    public var timeString: String?
    public let titleLbl = UILabel()
    public let cancelButton = UIButton()
    public let doneButton = UIButton()
    public var action = {}
    var coverView: UIView!
    var topView: UIView?
    let TOOL_BAR_HEIGHT: CGFloat = 35
    let PICKER_WIDTH = UIScreen.main.bounds.size.width
    let PICKER_HEIGHT: CGFloat = 200
    let CONTAINER_HEIGHT: CGFloat = 200 + 35
    
    required public init() {
        self.coverView = UIView.init(frame: UIScreen.main.bounds)
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        pickerContainer.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height+CONTAINER_HEIGHT, width: PICKER_WIDTH, height: CONTAINER_HEIGHT)
        pickerContainer.backgroundColor = .white
        picker.frame = CGRect(x: 0.0, y: TOOL_BAR_HEIGHT, width: PICKER_WIDTH, height: PICKER_HEIGHT)
        picker.setDate(NSDate() as Date, animated: true)
        picker.minimumDate = NSDate() as Date
        picker.datePickerMode = UIDatePickerMode.dateAndTime
        pickerContainer.addSubview(picker)
        
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        cancelButton.setTitleColor(.blue, for: .normal)
        cancelButton.backgroundColor = UIColor.groupTableViewBackground
        cancelButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        cancelButton.frame = CGRect(x: 0, y: 0, width: PICKER_WIDTH/3, height: TOOL_BAR_HEIGHT)
        
        titleLbl.text = "請選擇時間"
        titleLbl.font = UIFont.systemFont(ofSize: 12)
        titleLbl.frame = CGRect(x: PICKER_WIDTH/3, y: 0, width: PICKER_WIDTH/3, height: TOOL_BAR_HEIGHT)
        titleLbl.backgroundColor = .groupTableViewBackground
        titleLbl.textColor = .black
        titleLbl.textAlignment = .center
        
        doneButton.setTitle("✓", for: .normal)
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
    
    public func selectedDate(dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self.picker.date)
    }
    
    public func show(_ vc: UIViewController? = nil, action: @escaping()->()) {
        topView = TMUI.shared.getTopView()
        UIView.animate(withDuration: 0.4, animations: {
            var frame:CGRect = self.pickerContainer.frame
            frame.origin.y = UIScreen.main.bounds.size.height - self.CONTAINER_HEIGHT
            self.pickerContainer.frame = frame
            self.action = action
            if vc == nil {
                self.topView?.addSubview(self.coverView)
                self.topView?.addSubview(self.pickerContainer)
            }else {
                vc?.view.addSubview(self.coverView)
                vc?.view.addSubview(self.pickerContainer)
            }
        })
    }
    
    @objc private func dismiss() {
        UIView.animate(withDuration: 0.4, animations: {
            self.pickerContainer.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height+self.CONTAINER_HEIGHT, width: self.PICKER_WIDTH, height: self.CONTAINER_HEIGHT)
            self.coverView.removeFromSuperview()
        })
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        timeString = dateFormatter.string(from: self.picker.date)
    }
    
    @objc private func dismissWithAction() {
        UIView.animate(withDuration: 0.4, animations: {
            self.pickerContainer.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height+self.CONTAINER_HEIGHT, width: self.PICKER_WIDTH, height: self.CONTAINER_HEIGHT)
            self.coverView.removeFromSuperview()
        })
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        timeString = dateFormatter.string(from: self.picker.date)
        action()
    }
    
}
