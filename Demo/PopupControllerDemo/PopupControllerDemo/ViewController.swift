//
//  ViewController.swift
//  PopupControllerDemo
//
//  Created by 郑志强 on 2021/3/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        view.addSubview(btn)
    }

    @objc func click() {
        let vc = PresentedViewController()
        PopupController.show(vc)
    }
    
    
}

