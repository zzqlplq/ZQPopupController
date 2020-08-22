//
//  TestViewController.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/13.
//  Copyright © 2020 郑志强. All rights reserved.
//

import UIKit
import PopupController

class TestViewController: UIViewController, PopupProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    
    func setupSubviews() {

        let btn = UIButton()
            .title("返回")
            .titleColor(.white)
            .target(self, action: #selector(click))
            .backgroundColor(.red)
        btn.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(btn)
        
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 300).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    @objc func click() {
        PopupController.dismiss(self)
    }

}
