//
//  CalculatorPresenter.swift
//  Calculator
//
//  Created by Evgenij Polubin on 28.02.2024.
//

import Foundation

// TODO: - добавить модификатор private для всех свойств (если они не используются извне)

protocol ICalculatorPresenter: AnyObject {
    func viewDidLoad()
}

final class CalculatorPresenter: ICalculatorPresenter {
    
    weak var view: ICalculatorViewController?
    
    var router: ICalculatorRouter
    var factory: IMakeModelFactory
    
    var result = String() {
        didSet {
            print(result)
            let model = factory.makeModelsCalculatorView(result: result, onTapButton: onTapButton)
            view?.configureCalculatorViewModels(with: model)
        }
    }
    
    init(router: ICalculatorRouter, factory: IMakeModelFactory) {
        self.router = router
        self.factory = factory
    }

    func viewDidLoad() {
        configureCalculatorViewModels()
    }
    
    private func configureCalculatorViewModels() {
        view?.configureCalculatorViewModels(
            with: factory.makeModelsCalculatorView(
                result: result,
                onTapButton: onTapButton
            )
        )
    }

    private func onTapButton(_ button: CalculatorButton) {
        switch button {
        case .allClear: result = ""
        case .staples: result = "()"
        case .plusMinus: result = "+/-"
        case .percentage: result = "%"
        case .divide: result = "÷"
        case .multiply: result = "x"
        case .sustract: result = "-"
        case .add: result = "+"
        case .equals: result = ""
        case .decimal: result = ","
        case .number(let int): result.append(String(int))
        }
    }
}
