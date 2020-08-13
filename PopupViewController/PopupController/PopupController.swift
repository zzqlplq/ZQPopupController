//
//  PopupController.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/12.
//  Copyright © 2020 郑志强. All rights reserved.
//

import UIKit

class PopupController: NSObject {
    
    private var apperance: PopupApperanceProtocol
    
    required init(apperance: PopupApperanceProtocol) {
        self.apperance = apperance
    }
    
    public static func show(_ presented: PopupProtocol,
                     presentingViewController: UIViewController? = UIWindow.key?.rootViewController,
                     apperance: PopupApperanceProtocol = PopupApperance(),
                     completion:(()-> Void)? = nil) {
        
        let controller = self.init(apperance: apperance)
        let presentedViewController = presented.presentedViewController
        presentedViewController.transitioningDelegate = controller
        presentedViewController.modalPresentationStyle = .custom
        presentingViewController?.present(presentedViewController, animated: true, completion: completion)
    }
    
    public static func dismiss(_ presented: PopupProtocol,
                        apperance: PopupApperanceProtocol = PopupApperance(),
                        completion:(()-> Void)? = nil) {
        
        let controller = self.init(apperance: apperance)
        let presentedViewController = presented.presentedViewController
        presentedViewController.transitioningDelegate = controller
        presentedViewController.modalPresentationStyle = .custom
        presentedViewController.dismiss(animated: true, completion: completion)
    }
}


extension PopupController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let controller = PopupPresentationController(presentedViewController: presented, presenting: presenting)
        return controller
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return apperance.showAnimation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return apperance.dismissAnimation
    }
}

private extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}




