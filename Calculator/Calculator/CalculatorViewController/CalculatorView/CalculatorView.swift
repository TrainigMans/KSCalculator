//
//  CalculatorView.swift
//  Calculator
//
//  Created by Evgenij Polubin on 28.02.2024.
//

import UIKit

final class CalculatorView: UIView {
    
    //MARK: - Properties
    
    private let textFieldView = TextFieldView()
    private let labelView = LabelView()
    private let detailedButtonsStackView = DetailedButtonsStackView()
    private let separatingLineView = SeparatingLineView()
    let buttonsCollectionView = ButtonsCollectionView()
    
    //MARK: - Configuration
    
    func configureCalculatorViewModels(with model: CalculatorViewModels) {
        textFieldView.configure(with: model.textFieldViewModel)
        labelView.configure(with: model.labelViewModel)
        detailedButtonsStackView.configure(with: model.detailedButtonStackViewModels)
        buttonsCollectionView.configure(with: model.calculatorCollectionViewModels)
    }
    
    //MARK: - Prepare
        
    func prepare() {
        setupUI()
        setupLayout()
    }
    
    private func setupUI() {
        addSubviews(labelView, textFieldView, detailedButtonsStackView, separatingLineView, buttonsCollectionView)
    }
    
    private func setupLayout() {
        [labelView, textFieldView, detailedButtonsStackView, separatingLineView, buttonsCollectionView].forEach { 
            $0.translatesAutoresizingMaskIntoConstraints = false 
        }
        
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor),
            labelView.bottomAnchor.constraint(equalTo: detailedButtonsStackView.topAnchor),
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            textFieldView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            textFieldView.bottomAnchor.constraint(equalTo: topAnchor, constant: 225),
            textFieldView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textFieldView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            detailedButtonsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 310),
            detailedButtonsStackView.bottomAnchor.constraint(equalTo: separatingLineView.topAnchor, constant: 5),
            detailedButtonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            detailedButtonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200),
            
            separatingLineView.topAnchor.constraint(equalTo: topAnchor, constant: 350),
            separatingLineView.bottomAnchor.constraint(equalTo: buttonsCollectionView.topAnchor, constant: -10),
            separatingLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatingLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            buttonsCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 400),
            buttonsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            buttonsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
    }
}
