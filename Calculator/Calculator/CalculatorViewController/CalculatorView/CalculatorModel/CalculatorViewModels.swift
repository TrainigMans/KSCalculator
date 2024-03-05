//
//  CalculatorCollectionViewModel.swift
//  Calculator
//
//  Created by Evgenij Polubin on 02.03.2024.
//

import UIKit

enum CurrentNumber {
    case firstNumber
    case secondNumber
}

// TODO: - убрать множесвенное название -s
struct CalculatorViewModels {
    var textFieldViewModel: TextFieldViewModel
    let labelViewModel: LabelViewModel
    // TODO: - убрать множесвенное название -s
    let detailedButtonStackViewModels: DetailedButtonsStackViewModel
    // тут норм 
    let calculatorCollectionViewModels: [CalculatorButtonCellModel]
}
