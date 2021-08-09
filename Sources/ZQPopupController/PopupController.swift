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
        
    private let animator: PopupAnimationProtocol
        
    private init (animator: PopupAnimationProtocol) {
        self.animator = animator
    }
        
    public static func show(_ presented: PopupProtocol,
                            animationType: PopupShowAnimator = .fade,
                            presentingViewController: UIViewController? = nil,
                            completion:(()-> Void)? = nil) {
        let animator = PopupShowAnimator(rawValue: animationType)
        PopupController.show(presented, animation: animator, presentingViewController: presentingViewController, completion: completion)
    }
    
    
    public  static func show(_ presented: PopupProtocol, animation: PopupAnimationProtocol, presentingViewController: UIViewController? = nil, completion:(()-> Void)? = nil) {
        
        let controller = PopupController(animator: animation)
        let presentedViewController = presented.presentedViewController
        presentedViewController.transitioningDelegate = controller
        presentedViewController.modalPresentationStyle = .custom

        let presenting = presentingViewController ?? UIWindow.key?.rootViewController
        presenting?.present(presentedViewController, animated: true, completion: completion)
    }
    
    
    public static func dismiss(_ presented: PopupProtocol,
                               animationType: PopupDismissAnimator = .fade,
                               completion:(()-> Void)? = nil) {
        
        let animator = PopupDismissAnimator(rawValue: animationType)
        PopupController.dismiss(presented, animation: animator, completion: completion)
    }
    
    
    public static func dismiss(_ presented: PopupProtocol,
                               animation: PopupAnimationProtocol,
                               completion:(()-> Void)? = nil) {
    
        let controller = PopupController(animator: animation)
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
        return animator.animation
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator.animation
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



