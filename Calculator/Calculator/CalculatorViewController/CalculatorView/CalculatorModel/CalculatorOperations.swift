//
//  CalculatorOperations.swift
//  Calculator
//
//  Created by Evgenij Polubin on 02.03.2024.
//

import Foundation

enum CalculatorOperations {
    case divide
    case multiple
    case substract
    case add
    
    var title: String {
        switch self {
        case .divide: return "÷"
        case .multiple: return "*"
        case .substract: return "-"
        case .add: return "+"
        }
    }
}
