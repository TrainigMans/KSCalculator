//
//  UIColor.swift
//  Calculator
//
//  Created by Evgenij Polubin on 28.02.2024.
//

import UIKit

extension UIColor {
    static let colors = Colors()
}

struct Colors {
    var backgroundButton: UIColor { UIColor(named: "backgroundButton") ?? UIColor() }
    var backgroundEqually: UIColor { UIColor(named: "backgroundEqually") ?? UIColor() }
    var backgroundView: UIColor { UIColor(named: "backgroundView") ?? UIColor() }
    var selectedBackground: UIColor { UIColor(named: "selectedBackground") ?? UIColor() }
    var selectedBackgroundEqually: UIColor { UIColor(named: "selectedBackgroundEqually") ?? UIColor() }
    var separatedLine: UIColor { UIColor(named: "separatedLine") ?? UIColor() }
    var textButton: UIColor { UIColor(named: "textButton") ?? UIColor() }
    var textCancel: UIColor { UIColor(named: "textCancel") ?? UIColor() }
    var textLabel: UIColor { UIColor(named: "textLabel") ?? UIColor() }
}
