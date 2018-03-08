//
//  NaviExt.swift
//  Weapons
//
//  Created by 瞿炬星 on 2018/3/3.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
