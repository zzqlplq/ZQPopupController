//
//  ViewController.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/8.
//  Copyright © 2020 郑志强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn.backgroundColor = .green
        
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        view.addSubview(btn)
    }


    @objc func click() {
//        let demovc = DemoViewController()
////        PopContainer.popShow(demovc, from: self);
//
//        PopupController.show(demovc) {
//            print("completion")
//        }
        
        let view = CustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        PopupController.show(view)
    }
}


class CustomView: UIView, PopupProtocol {
    
    var offset: CGPoint {
        return CGPoint(x: 50, y: 50)
    }
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          setupViews()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      func setupViews() {
          let btn = UIButton(frame: bounds)
        btn.backgroundColor = .purple
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
          addSubview(btn)
      }
        
    @objc func click() {
        PopupController.dismiss(self)
    }
}

