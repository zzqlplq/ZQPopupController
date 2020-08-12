//
//  PopupApperanceConfig.swift
//  PopupViewController
//
//  Created by 郑志强 on 2020/8/12.
//  Copyright © 2020 郑志强. All rights reserved.
//

import UIKit

protocol PopupApperanceProtocol {
    var showAnimation: UIViewControllerAnimatedTransitioning? { get }
    var dismissAnimation: UIViewControllerAnimatedTransitioning? { get }
}


extension PopupApperanceProtocol {
    var showAnimation: UIViewControllerAnimatedTransitioning? {
        return PopupShowAnimation()
    }

    var dismissAnimation: UIViewControllerAnimatedTransitioning? {
        return PopupDismissAnimation()
    }
}


class PopupApperance: PopupApperanceProtocol {
    
}

