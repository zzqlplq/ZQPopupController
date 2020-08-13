//
//  PopupApperanceConfig.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/12.
//  Copyright © 2020 郑志强. All rights reserved.
//

import UIKit

public protocol PopupApperanceProtocol {
    var showAnimation: UIViewControllerAnimatedTransitioning? { get }
    var dismissAnimation: UIViewControllerAnimatedTransitioning? { get }
}


class PopupApperance: PopupApperanceProtocol {

    var showAnimation: UIViewControllerAnimatedTransitioning? {
        return PopupShowAnimation()
    }

    var dismissAnimation: UIViewControllerAnimatedTransitioning? {
        return PopupDismissAnimation()
    }
}


fileprivate class PopupShowAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    public var duration: TimeInterval = 0.3
        
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to), let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        toView.frame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        
        toView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2.0, options: .curveEaseInOut, animations: {
            toView.transform = .identity
        }) { (finish) in
            transitionContext.completeTransition(finish)
        }
    }
}


fileprivate class PopupDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    public var duration: TimeInterval = 0.2

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
            fromView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            fromView.alpha = 0
        }) { (finished) in
            fromView.transform = .identity
            fromView.alpha = 1.0
            transitionContext.completeTransition(finished)
        }
    }
}
