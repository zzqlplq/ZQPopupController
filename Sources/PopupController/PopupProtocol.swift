//
//  PopupProtocol.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/12.
//  Copyright © 2020 郑志强. All rights reserved.
//

import UIKit

public protocol PopupProtocol {
    var presentedViewController: UIViewController { get }
    var offset: CGPoint { get }
}


extension PopupProtocol where Self: UIViewController {
    var presentedViewController: UIViewController {
        return self
    }
    var offset: CGPoint {
        return CGPoint(x: 0, y: 0)
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
    var offset: CGPoint {
        return CGPoint(x: 0, y: 0)
    }
}


private class PopupTempContainerViewController: UIViewController, PopupProtocol {
    
    var contentView: PopupProtocol
    
    init(contentView: PopupProtocol) {
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
        if let contentView = self.contentView as? UIView  {
            view.addSubview(contentView)
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: self.contentView.offset.y).isActive = true
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: self.contentView.offset.x).isActive = true
            contentView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width).isActive = true
            contentView.heightAnchor.constraint(equalToConstant: contentView.frame.size.height).isActive = true
        }
    }
}

private extension UIView {
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
