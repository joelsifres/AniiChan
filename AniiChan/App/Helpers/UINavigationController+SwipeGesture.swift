//
//  UINavigationController+SwipeGesture.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 18/6/23.
//

import class UIKit.UINavigationController

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
