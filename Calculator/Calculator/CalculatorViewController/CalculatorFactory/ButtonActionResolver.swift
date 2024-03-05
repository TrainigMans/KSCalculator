//
//  ButtonActionResolver.swift
//  Calculator
//
//  Created by Evgenij Polubin on 29.02.2024.
//

import Foundation

protocol IButtonActionResolver: AnyObject {
    func resolve(for model: CalculatorModel) 
}
