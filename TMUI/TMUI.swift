//
//  TMUI.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/6/25.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import Foundation
import UIKit

public class TMUI {
    public static let shared = TMUI()
    // MARK: - 畫面 View
    // 取得最上層的View
    func getTopView() -> UIView? {
        if var topVC = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedVC = topVC.presentedViewController{
                topVC = presentedVC
            }
            return topVC.view
        }else {
            return nil
        }
    }
    // 取得中心點
    public func getCenter(_ view: UIView) -> CGPoint {
        var center: CGPoint = CGPoint(x: 0,y: 0)
        center.x = view.frame.origin.x + view.frame.size.width/2
        center.y = view.frame.origin.y + view.frame.size.height/2
        
        return center
    }
    // 取得最上層的View
    public func getToppestWindowView() -> UIView? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController.view
        }else {
            return nil
        }
    }
    
    // MARK: - 畫面: 事件動作 Action
    // 使UIView可點擊
    public func makeClickable(_ view: UIView, target: Any, selector:Selector) {
        let tap = UITapGestureRecognizer(target: target, action: selector)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - 畫面: 特效
    // 增加陰影
    public func addShadow(_ view: UIView, radius: CGFloat) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = radius
    }
    // 增加陰影(with offset)
    public func addShadow(_ view: UIView, radius: CGFloat, offset: CGSize) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = offset
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = radius //Here your control your blur
    }
    // 增加陰影(指定顏色)
    public func addShadow(_ view: UIView, radius: CGFloat, color: CGColor) {
        view.layer.shadowColor = color
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = radius
    }
    
    // 產生圓角
    public func makeRoundCorner(_ view: UIView, radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
    
    // 產生圓角(有陰影)
    public func makeRoundCorner(_ view: UIView, radius: CGFloat, withShadowRadius shadowRadius: CGFloat) {
        view.layer.cornerRadius = radius
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = shadowRadius //Here your control your blur
    }
    // 製作圓形
    public func makeCircle(_ view: UIView) {
        view.layer.cornerRadius = view.frame.size.width/2
        view.layer.masksToBounds = true
    }
    
    //製作邊匡+圓角
    public func makeBorderWithRoundEdge(_ view: UIView, radius:CGFloat, borderWidth: CGFloat, borderColor: CGColor) {
        view.layer.borderColor = borderColor
        view.layer.borderWidth = borderWidth
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
    // 製作邊筐(顏色)
    public func makeBorder(_ view: UIView, borderWidth: CGFloat, borderColor: CGColor) {
        view.layer.borderColor = borderColor
        view.layer.borderWidth = borderWidth
        view.layer.masksToBounds = true
    }
    
    // MARK: - 畫面: 動畫
    // 淡入
    public func fadeIn(_ aView: UIView, alpha: CGFloat, duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            aView.alpha = alpha
        });
    }
    // 淡出
    public func fadeOut(_ aView: UIView, duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            aView.alpha = 0.0
        });
    }
    /// 隱藏->顯示
    ///
    /// - Parameters:
    ///   - aView: 要顯示的View
    ///   - basicView: 基底的View
    public func animationShowFromHidden(_ aView: UIView, basicView: UIView) {
        aView.isHidden = false
        aView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        aView.alpha = 0.0;
        UIView.animate(withDuration: 1, animations: {
            aView.alpha = 1.0
            aView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    /// 隱藏->顯示(含時間區間)
    ///
    /// - Parameters:
    ///   - aView: 要顯示的View
    ///   - basicView: 基底的View
    ///   - duration: 顯示時間
    public func animationShowFromHidden(_ aView: UIView, basicView: UIView, duration: TimeInterval) {
        basicView.addSubview(aView)
        aView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        aView.alpha = 0.0;
        UIView.animate(withDuration: duration, animations: {
            aView.alpha = 1.0
            aView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    /// 隱藏
    ///
    /// - Parameters:
    ///   - aView: 要隱藏的View
    ///   - duration: 時間區間
    public func animationHidden(_ aView: UIView, duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            aView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            aView.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                aView.isHidden = true
            }
        });
    }
    
    /// 移除
    ///
    /// - Parameters:
    ///   - aView: 要移除的View
    ///   - duration: 時間區間
    public func animationRemoved(_ aView: UIView, duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            aView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            aView.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                aView.removeFromSuperview()
            }
        });
    }
    
    public func showResponseErrorAlert(vc: UIViewController, msg: String?) {
        let alert = UIAlertController(title: "錯誤訊息", message: (msg == nil ? "伺服器發生異常" : msg!), preferredStyle: .alert);
        let cancelAction = UIAlertAction.init(title: "確定", style: .cancel, handler: {(action) in })
        alert.addAction(cancelAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    public func textView(_ textView: UITextView, target: Any, doneAction: Selector){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: target, action: doneAction)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: target, action: cancelAction)
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textView.inputAccessoryView = toolBar
    }
    
    public func textField(_ textField: UITextField, target: Any, doneAction: Selector){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: target, action: doneAction)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: target, action: cancelAction)
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.inputAccessoryView = toolBar
    }
}
