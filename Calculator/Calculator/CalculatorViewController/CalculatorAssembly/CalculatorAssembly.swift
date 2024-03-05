//
//  CalculatorAssembly.swift
//  Calculator
//
//  Created by Evgenij Polubin on 28.02.2024.
//

import UIKit

protocol ICalculatorAssembly: AnyObject {
    func assenble() -> UIViewController
}

final class CalculatorAssembly: ICalculatorAssembly {
    
    func assenble() -> UIViewController {
        let router = CalculatorRouter()
        let factory = MakeModelFactory()
        let presenteer = CalculatorPresenter(router: router, factory: factory)
        let viewController = CalculatorViewController(presenter: presenteer)
        
        router.transitionHandler = viewController
        presenteer.view = viewController
        return viewController
    }
}
