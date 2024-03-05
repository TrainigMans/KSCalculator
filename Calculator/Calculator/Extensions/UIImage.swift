//
//  UIImage.swift
//  Calculator
//
//  Created by Evgenij Polubin on 01.03.2024.
//

import UIKit

extension UIImage {
    static let detailedButtonsImage = DetailedButtonsImage()
}

struct DetailedButtonsImage {
    var clock: UIImage { UIImage(systemName: "clock") ?? UIImage() }
    var conversion: UIImage { UIImage(systemName: "ruler") ?? UIImage() }
    var engineeringMode: UIImage { UIImage(systemName: "x.squareroot") ?? UIImage() }
    var delete: UIImage { UIImage(systemName: "delete.left") ?? UIImage() }
}
