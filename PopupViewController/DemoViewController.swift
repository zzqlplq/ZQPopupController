//
//  DemoViewController.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/8.
//  Copyright © 2020 郑志强. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController, PopupProtocol {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        btn.backgroundColor = .blue
        
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        view.addSubview(btn)
        
        view.backgroundColor = .red
    }
    
    
    @objc func click() {
        PopupController.dismiss(self)
    }

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
