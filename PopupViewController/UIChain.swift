//
//  UIChain.swift
//  EHelloForTeacher
//
//  Created by 郑志强 on 2020/7/23.
//  Copyright © 2020 郑志强. All rights reserved.
//

import UIKit

extension UIView {
    
    func backgroundColor(_ color: UIColor) -> UIView {
        self.backgroundColor = color
        return self
    }
    
    func addTapGesture(_ target: Any?, action: Selector, tapGesuture: ((_ :UITapGestureRecognizer) -> Void)? = nil ) -> UIView {
        let tap = UITapGestureRecognizer(target: target, action: action)
        if let block = tapGesuture {
            block(tap)
        }
        addGestureRecognizer(tap)
        return self
    }
}



extension UIImageView {
    
    func image(_ image: UIImage?) -> UIImageView {
        self.image = image
        return self
    }
    
    func contentMode(_ mode: UIView.ContentMode) -> UIImageView {
        self.contentMode = mode
        return self
    }
}


extension UIButton {
    
    func title(_ title: String?, for state: UIControl.State = .normal) -> UIButton {
        self.setTitle(title, for: state)
        return self
    }
    
    func image(_ image: UIImage?, for state: UIControl.State = .normal) -> UIButton {
        self.setImage(image, for: state)
        return self
    }
    
    func backgroundImage(_ image: UIImage?, for state: UIControl.State = .normal) -> UIButton {
        self.setBackgroundImage(image, for: state)
        return self
    }

    func titleColor(_ color: UIColor, for state: UIControl.State = .normal) -> UIButton {
        self.setTitleColor(color, for: state)
        return self
    }
    
    func titleFont(_ fontSize: CGFloat) -> UIButton {
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        return self
    }
    
    func target(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) -> UIButton {
        self.addTarget(target, action: action, for: event)
        return self
    }
    
    func userInteraction(_ enable: Bool) -> UIButton {
         self.isUserInteractionEnabled = enable
         return self
     }
}


extension UILabel {

    func fontSize(_ size: CGFloat) -> UILabel {
        self.font = UIFont.systemFont(ofSize: size)
        return self
    }
    
    func font(_ font: UIFont) -> UILabel {
        self.font = font
        return self
    }
    
    func textColor(_ color: UIColor) -> UILabel {
        self.textColor = color
        return self
    }
    
    func text(_ text: String) -> UILabel {
        self.text = text
        return self
    }
    
    func textAlignment(_ alignment: NSTextAlignment = .center) -> UILabel {
        self.textAlignment = alignment
        return self
    }
}


extension UITableView {
    
    func tableFooterView(_ frame: CGRect = .zero) -> UITableView {
        self.tableFooterView = UIView(frame: frame)
        return self
    }
    
    func delegate(_ delegate: UITableViewDelegate) -> UITableView {
        self.delegate = delegate
        return self
    }
    
    func dataSource(_ dataSource: UITableViewDataSource) -> UITableView {
        self.dataSource = dataSource
        return self
    }
    
    func bounces(_ enable: Bool) -> UITableView {
        self.bounces = enable
        return self
    }
    
    func separatorStyle(_ style: UITableViewCell.SeparatorStyle ) -> UITableView {
        self.separatorStyle = style
        return self
    }
    
}
