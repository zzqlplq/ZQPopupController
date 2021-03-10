//
//  PresentedViewController.swift
//  PopupControllerDemo
//
//  Created by 郑志强 on 2021/3/7.
//

import UIKit

class PresentedViewController: UIViewController, PopupProtocol {

    var animationType: PopupAnimationType!
  
    override func viewDidLoad() {
                
        super.viewDidLoad()

        view.backgroundColor = .clear
//
//        let containerView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 400))
//        containerView.backgroundColor = .white
//        view.addSubview(containerView)
//        let btn = UIButton(frame: CGRect(x: 50, y: 55, width: 100, height: 100))
//        btn.backgroundColor = .blue
//        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
//
//        containerView.addSubview(btn)
    }
    
    @IBAction func btnClick(_ sender: Any) {
        PopupController.dismiss(self, animationType: self.animationType)
    }

}
