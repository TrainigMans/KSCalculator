//
//  UIView+addSubviews.swift
//  Calculator
//
//  Created by Evgenij Polubin on 29.02.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ view: UIView...) {
        view.forEach { addSubview($0) }
    }
}
