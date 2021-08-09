//
//  PopupAnimation.swift
//  ZQPopupController
//
//  Created by 郑志强 on 2021/3/9.
//
#if os(iOS)

import UIKit

public protocol PopupAnimationProtocol {
    var animation: UIViewControllerAnimatedTransitioning? { get }
}


extension PopupAnimationProtocol where Self: UIViewControllerAnimatedTransitioning {
    var animation: UIViewControllerAnimatedTransitioning? {
        return self
    }
}


class NoneShowAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.01
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to), let toView = transitionContext.view(forKey: .to) else { return }

        let containerView = transitionContext.containerView
        toView.frame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        UIView.animate(withDuration: 0.01, animations: {}) { finished  in
            transitionContext.completeTransition(finished)
        }
    }
}


class ScaleShowAnimator: NSObject, UIViewControllerAnimatedTransitioning {
   
    let duration: TimeInterval
    
    init(_ duration: TimeInterval = 0.3) {
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
        toView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)

        UIView.animate(withDuration: self.duration,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 2,
                       options: .curveEaseInOut) {
            toView.transform = .identity
        } completion: { finished in
            transitionContext.completeTransition(finished)
        }
    }
}


class FadeShowAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration: TimeInterval
    
    init(_ duration: TimeInterval = 0.3) {
        self.duration = duration
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to), let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        toView.frame = transitionContext.finalFrame(for: toVC)
        toView.alpha = 0
        containerView.addSubview(toView)

        UIView.animate(withDuration: self.duration,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 2,
                       options: .curveEaseInOut) {
            toView.alpha = 1
        } completion: { finished in
            transitionContext.completeTransition(finished)
        }

    }
}


class MoveInAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration: TimeInterval
    init(_ duration: TimeInterval = 0.3) {
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
        toView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)

        UIView.animate(withDuration: self.duration,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 2,
                       options: .curveEaseInOut) {
            toView.transform = .identity
        } completion: { finished in
            transitionContext.completeTransition(finished)
        }
    }
}


class NoneDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.01
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard (transitionContext.view(forKey: .from)) != nil else { return }
        UIView.animate(withDuration: 0.01, animations: {}) { finished  in
            transitionContext.completeTransition(finished)
        }
    }
}


class ScaleDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration: TimeInterval
    init(duration: TimeInterval = 0.2) {
        self.duration = duration
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }

        UIView.animate(withDuration: self.duration,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 2.0,
                       options: .curveEaseInOut) {
            
            fromView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            
        } completion: { finished in
            transitionContext.completeTransition(finished)
        }    }
}


class FadeDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration: TimeInterval
    init(duration: TimeInterval = 0.2) {
        self.duration = duration
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }

        UIView.animate(withDuration: self.duration,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 2.0,
                       options: .curveEaseInOut) {

            fromView.alpha = 0

        } completion: { finished in
            transitionContext.completeTransition(finished)
        }
    }
}


class MoveOutAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var duration: TimeInterval
    init(duration: TimeInterval = 0.2) {
        self.duration = duration
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
       return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }

        UIView.animate(withDuration: self.duration,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 2.0,
                       options: .curveEaseInOut) {
                fromView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        } completion: { finished in
            transitionContext.completeTransition(finished)
        }
    }
}


extension NoneShowAnimator: PopupAnimationProtocol { }
extension ScaleShowAnimator: PopupAnimationProtocol { }
extension FadeShowAnimator: PopupAnimationProtocol { }
extension MoveInAnimator: PopupAnimationProtocol { }
extension NoneDismissAnimator: PopupAnimationProtocol { }
extension ScaleDismissAnimator: PopupAnimationProtocol { }
extension FadeDismissAnimator: PopupAnimationProtocol { }
extension MoveOutAnimator: PopupAnimationProtocol { }


 public struct PopupShowAnimator: RawRepresentable {

    public static let none = PopupShowAnimator(rawValue: NoneShowAnimator())
    public static let fade = PopupShowAnimator(rawValue: FadeShowAnimator())
    public static let sacle = PopupShowAnimator(rawValue: ScaleShowAnimator())
    public static let moveIn = PopupShowAnimator(rawValue: MoveInAnimator())
    
    public var rawValue: PopupAnimationProtocol
    public init (rawValue: PopupAnimationProtocol) {
        self.rawValue = rawValue
    }
}

extension PopupShowAnimator: PopupAnimationProtocol {
    public var animation: UIViewControllerAnimatedTransitioning? {
        return rawValue.animation
    }
}

public struct PopupDismissAnimator: RawRepresentable {
    
    public static let none = PopupDismissAnimator(rawValue: NoneDismissAnimator())
    public static let fade = PopupDismissAnimator(rawValue: FadeDismissAnimator())
    public static let sacle = PopupDismissAnimator(rawValue: ScaleDismissAnimator())
    public static let moveOut = PopupDismissAnimator(rawValue: MoveOutAnimator())
    
    public var rawValue: PopupAnimationProtocol
    public init (rawValue: PopupAnimationProtocol) {
        self.rawValue = rawValue
    }
}


extension PopupDismissAnimator: PopupAnimationProtocol {
    public var animation: UIViewControllerAnimatedTransitioning? {
        return rawValue.animation
    }
}



#endif
