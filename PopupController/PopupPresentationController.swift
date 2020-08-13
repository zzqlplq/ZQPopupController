//
//  PopupPresentationController.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/8.
//  Copyright © 2020 郑志强. All rights reserved.
//

import UIKit

class PopupPresentationController: UIPresentationController {
    
    private lazy var backgrounView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()
    
    override open func presentationTransitionWillBegin() {
    
        if let containerView = containerView {
            containerView.insertSubview(backgrounView, at: 0)
            backgrounView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            backgrounView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            backgrounView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
            backgrounView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            backgroundViewAnimation(animationIn: true)
        }
    }
    
    override open func dismissalTransitionWillBegin() {
        backgroundViewAnimation(animationIn: false)
    }
    
    private func backgroundViewAnimation(animationIn: Bool) {
        let alpha: CGFloat = animationIn ? 1 : 0
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.backgrounView.alpha = alpha
            }, completion: nil)
        }
    }
}
