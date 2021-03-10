//
//  PopupAnimation.swift
//  PopupController
//
//  Created by 郑志强 on 2021/3/9.
//
#if os(iOS)

import UIKit

public protocol PopupAnimatorProtocal {
    var showAnimation: UIViewControllerAnimatedTransitioning? { get }
    var dismissAnimation: UIViewControllerAnimatedTransitioning? { get }
}


public enum PopupAnimationType {
    case fade
    case scale
    case moveIn
    case moveOut
}


class PopupAnimator: NSObject, PopupAnimatorProtocal {
    
    var type: PopupAnimationType
    var duration: TimeInterval
    
    required init(type: PopupAnimationType) {
        self.type = type
        self.duration = 0.3
    }
    
    init(type: PopupAnimationType, duration: TimeInterval) {
        self.type = type
        self.duration = duration
    }
    
    var showAnimation: UIViewControllerAnimatedTransitioning? {
        return ShowAnimator(type: self.type, duration: self.duration)
    }
    
    var dismissAnimation: UIViewControllerAnimatedTransitioning? {
        return DismissAnimator(type: self.type, duration: self.duration)
    }
}


class ShowAnimator: NSObject, UIViewControllerAnimatedTransitioning {
   
    var type: PopupAnimationType
    var duration: TimeInterval
    
    required init(type: PopupAnimationType, duration: TimeInterval) {
        self.type = type
        self.duration = duration
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
     
        guard let toVC = transitionContext.viewController(forKey: .to), let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        toView.frame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
                
        switch self.type {
        case .fade:
            toView.alpha = 0
        case .scale:
            toView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        case .moveIn:
            toView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        case .moveOut: break
        }
        
        UIView.animate(withDuration: self.duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2.0, options: .curveEaseInOut) {
            
            switch self.type {
            case .scale, .moveIn:
                toView.transform = .identity
            case .fade:
                toView.alpha = 1
            case .moveOut: break
            }
        } completion: { finished in
            transitionContext.completeTransition(finished)
        }
    }
}


class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var type: PopupAnimationType
    var duration: TimeInterval
    
    required init(type: PopupAnimationType, duration: TimeInterval) {
        self.type = type
        self.duration = duration
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }

        UIView.animate(withDuration: self.duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2.0, options: .curveEaseInOut) {
         
            switch self.type {
            case .fade:
                fromView.alpha = 0
            case .scale:
                fromView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            case .moveOut:
                fromView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
            case .moveIn: break
            }
        } completion: { finished in
            transitionContext.completeTransition(finished)
        }
    }

}




#endif
