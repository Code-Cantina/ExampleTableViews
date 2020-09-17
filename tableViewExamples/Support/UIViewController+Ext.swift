//
//  UIViewController+Ext.swift
//  scrollingHeaderView
//
//  Created by Danny Copeland on 9/13/20.
//  Copyright © 2020 Danny Copeland. All rights reserved.
//

import UIKit

extension UIViewController {
    //MARK: Keyboard Dismissing
    // Call this once to dismiss open keyboards by tapping anywhere in the view controller
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    // Dismisses the keyboard from self.view
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}
