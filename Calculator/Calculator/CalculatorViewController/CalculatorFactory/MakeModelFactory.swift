//
//  MakeModelFactory.swift
//  Calculator
//
//  Created by Evgenij Polubin on 28.02.2024.
//

import Foundation

// 
protocol IMakeModelFactory: AnyObject {
    func makeModelsCalculatorView(result: String, onTapButton: @escaping (CalculatorButton) -> Void) -> CalculatorViewModels
}

final class MakeModelFactory: IMakeModelFactory {
    
    func makeModelsCalculatorView(
        result: String,
        onTapButton: @escaping (CalculatorButton) -> Void
    ) -> CalculatorViewModels {
        
        let textFieldViewModel: TextFieldViewModel
        if result.isEmpty {
            textFieldViewModel = TextFieldViewModel(text: "TextField Error")
        } else {
            textFieldViewModel = TextFieldViewModel(text: result)
        }
        var labelViewModel = LabelViewModel(text: "Label Error")
        let detailedButtonStackViewModels = DetailedButtonsStackViewModel(
            image: [
            .detailedButtonsImage.clock,
            .detailedButtonsImage.conversion, 
            .detailedButtonsImage.engineeringMode, 
            .detailedButtonsImage.delete
        ])
        let buttons: [CalculatorButton] = [
            .allClear, .staples, .percentage, .divide,
            .number(7), .number(8), .number(9), .multiply,
            .number(4), .number(5), .number(6), .sustract,
            .number(1), .number(2), .number(3), .add,
            .plusMinus, .number(0), .decimal, .equals,
        ]
        let buttonCells =  buttons.map { type in
            CalculatorButtonCellModel(type: type, onTap: { onTapButton(type) })
        }
        return CalculatorViewModels(
            textFieldViewModel: textFieldViewModel,
            labelViewModel: labelViewModel,
            detailedButtonStackViewModels: detailedButtonStackViewModels,
            calculatorCollectionViewModels: buttonCells
        )
    }
}
