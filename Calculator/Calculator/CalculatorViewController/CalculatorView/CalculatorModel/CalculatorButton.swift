//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Evgenij Polubin on 02.03.2024.
//

import Foundation

enum CalculatorButton {
    case allClear
    case staples
    case plusMinus
    case percentage
    case divide
    case multiply
    case sustract
    case add
    case equals
    case decimal
    case number(Int)
    
    init(calcButton: CalculatorButton) {
        switch calcButton {
        case .allClear, .staples, .plusMinus, .percentage, .divide, .multiply, .sustract, .add, .equals, .decimal: self = calcButton
        case .number(let number):
            if number.description.count == 1 {
                self = calcButton
            } else {
                fatalError("CalculatorButton.number Int was not 1 digit during init")
            }
        }
    }
    
    var title: String {
        switch self {
        case .allClear: return "C"
        case .staples: return "()"
        case .plusMinus: return "+/-"
        case .percentage: return "%"
        case .divide: return "÷"
        case .multiply: return "x"
        case .sustract: return "-"
        case .add: return "+"
        case .equals: return "="
        case .decimal: return ","
        case .number(let number): return number.description
        }
    }
}
