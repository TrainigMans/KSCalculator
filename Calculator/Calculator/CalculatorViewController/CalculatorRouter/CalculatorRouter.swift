//
//  CalculatorRouter.swift
//  Calculator
//
//  Created by Evgenij Polubin on 28.02.2024.
//

import UIKit

protocol ICalculatorRouter: AnyObject {
    func showDetails(index: Int)
}

final class CalculatorRouter: ICalculatorRouter {
    
    
    weak var transitionHandler: UIViewController?
    
    func showDetails(index: Int) {}
}
