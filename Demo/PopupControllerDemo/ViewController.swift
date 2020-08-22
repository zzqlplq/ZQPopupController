//
//  ViewController.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/8.
//  Copyright © 2020 郑志强. All rights reserved.
//

import UIKit
import PopupController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func popViewController(_ sender: Any) {
        let textVC = TestViewController()
        PopupController.show(textVC)
    }
    
    @IBAction func popView(_ sender: Any) {
        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        PopupController.show(customView)
    }
    
    
    @IBAction func customPop(_ sender: Any) {
        let customAnimationView = CustomAnimationView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        PopupController.show(customAnimationView, apperance: CustomAnimation())
    }
}



class CustomView: UIView, PopupProtocol {
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          setupViews()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      func setupViews() {
        let btn = UIButton(frame: bounds)
            .title("返回")
            .target(self, action: #selector(click))
            .backgroundColor(.purple)
        self.addSubview(btn)
    }
        
    @objc func click() {
        PopupController.dismiss(self)
    }
}


class CustomAnimationView: UIView, PopupProtocol {
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          setupViews()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }

    func setupViews() {
        let btn = UIButton(frame: bounds)
            .title("返回")
            .target(self, action: #selector(click))
            .backgroundColor(.red)
        
        self.addSubview(btn)
    }
    
    @objc func click() {
        PopupController.dismiss(self, apperance: CustomAnimation())
    }
}


class CustomAnimation: PopupApperanceProtocol {
    
    var showAnimation: UIViewControllerAnimatedTransitioning? {
        return FadeShowAnimation()
    }
    var dismissAnimation: UIViewControllerAnimatedTransitioning? {
        return FadeDismissAnimation()
    }
}


fileprivate class FadeShowAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    public var duration: TimeInterval = 0.3
        
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to), let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        toView.frame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        
        toView.alpha = 0
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2.0, options: .curveEaseInOut, animations: {
            toView.alpha = 1
        }) { (finish) in
            transitionContext.completeTransition(finish)
        }
    }
}


fileprivate class FadeDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    public var duration: TimeInterval = 0.2

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
            fromView.alpha = 0
        }) { (finished) in
            fromView.transform = .identity
            fromView.alpha = 1.0
            transitionContext.completeTransition(finished)
        }
    }
}

