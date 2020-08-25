//
//  PopupController.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/12.
//  Copyright © 2020 郑志强. All rights reserved.
//

#if os(iOS)

import UIKit

public class PopupController: NSObject {
    
    private var apperance: PopupApperanceProtocol = PopupApperance()
    
    required init(apperance: PopupApperanceProtocol?) {
        if let apperance = apperance {
            self.apperance = apperance
        }
    }
    
    /// 显示
    /// - Parameters:
    ///   - presented: 被弹出的视图
    ///   - presentingViewController: 主动弹出的控制器，因为权限问题，默认为nil
    ///   - apperance: 弹出的动画代理，因为权限问题，默认为nil
    ///   - completion: 弹出完成的回调
    
    public static func show(_ presented: PopupProtocol,
                     presentingViewController: UIViewController? = nil,
                     apperance: PopupApperanceProtocol? = nil,
                     completion:(()-> Void)? = nil) {
        
        let controller = self.init(apperance: apperance)
        let presentedViewController =  presented.presentedViewController
        presentedViewController.transitioningDelegate = controller
        presentedViewController.modalPresentationStyle = .custom
        
        let presenting = presentingViewController ?? UIWindow.key?.rootViewController
        presenting?.present(presentedViewController, animated: true, completion: completion)
    }
    
    /// 隐藏
    /// - Parameters:
    ///   - presented: 被弹出的视图
    ///   - apperance: 弹出的动画代理，因为权限问题，默认为nil
    ///   - completion: 弹出完成的回调
    
    public static func dismiss(_ presented: PopupProtocol,
                        apperance: PopupApperanceProtocol? = nil,
                        completion:(()-> Void)? = nil) {
        
        let controller = self.init(apperance: apperance)
        let presentedViewController = presented.presentedViewController
        presentedViewController.transitioningDelegate = controller
        presentedViewController.modalPresentationStyle = .custom
        presentedViewController.dismiss(animated: true, completion: completion)
    }
}


extension PopupController: UIViewControllerTransitioningDelegate {
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let controller = PopupPresentationController(presentedViewController: presented, presenting: presenting)
        return controller
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return apperance.showAnimation
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return apperance.dismissAnimation
    }
}


extension UIWindow {
     static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

#endif



