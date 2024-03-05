//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Evgenij Polubin on 26.02.2024.
//

import UIKit

protocol ICalculatorViewController: AnyObject {
    func configureCalculatorViewModels(with model: CalculatorViewModels)
}

// TODO: - добавить модификатор private для всех свойств (если они не используются извне)

class CalculatorViewController: UIViewController {
    
    // Dependency
    private let presenter: ICalculatorPresenter
    
    // Properties
    let calculatorView = CalculatorView()
    
    init(presenter: ICalculatorPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        presenter.viewDidLoad()
    }

    override func loadView() {
        // Подменяем вью контроллера на нашу вью, НЕ вызываем super
        // По идеи она сама ложится на весь экран, и констрейнты не нужны,
        // но здесь почему то ломается Layout калькулятора
        view = CalculatorView()
    }
}

extension CalculatorViewController: ICalculatorViewController {
    
    func configureCalculatorViewModels(with model: CalculatorViewModels) {
        calculatorView.configureCalculatorViewModels(with: model)
    }
}

private extension CalculatorViewController {
    
    func setupUI() {
        view.backgroundColor = .backgroundView
        view.addSubview(calculatorView)
        calculatorView.prepare()
    }
    
    func setupLayout() {
        
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculatorView.topAnchor.constraint(equalTo: view.topAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
