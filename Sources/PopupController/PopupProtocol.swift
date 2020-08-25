//
//  PopupProtocol.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/12.
//  Copyright © 2020 郑志强. All rights reserved.
//

#if os(iOS)

import UIKit

public protocol PopupProtocol: class {
    var presentedViewController: UIViewController { get }
}


extension PopupProtocol where Self: UIViewController {
    var presentedViewController: UIViewController {
        return self
    }
}


extension PopupProtocol where Self: UIView {
    
    var presentedViewController: UIViewController {
        if let viewController = self.viewController() as? PopupProtocol {
            return viewController.presentedViewController
        } else {
            return PopupTempContainerViewController(contentView: self)
        }
    }
    
    public var offset: CGPoint {
        return CGPoint(x: 0, y: 0)
    }
}


private class PopupTempContainerViewController: UIViewController, PopupProtocol {
    
    var contentView: UIView & PopupProtocol
    
    init(contentView: UIView & PopupProtocol) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupContentView()
    }
    
    func setupContentView() {
        view.addSubview(self.contentView)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: self.contentView.offset.y).isActive = true
        self.contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: self.contentView.offset.x).isActive = true
        self.contentView.widthAnchor.constraint(equalToConstant: self.contentView.frame.size.width).isActive = true
        self.contentView.heightAnchor.constraint(equalToConstant: self.contentView.frame.size.height).isActive = true
    }
}


extension UIView {
    
    func viewController() -> UIViewController? {
        var next = self.next
        while next != nil {
            if let next = next as? UIViewController {
                return next
            } else {
                next = next?.next
            }
        }
        return nil
    }
}

#endif
