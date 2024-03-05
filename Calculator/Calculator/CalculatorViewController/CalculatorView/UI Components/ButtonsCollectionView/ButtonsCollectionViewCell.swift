//
//  ButtonsCollectionViewCell.swift
//  Calculator
//
//  Created by Evgenij Polubin on 29.02.2024.
//

import UIKit

struct CalculatorButtonCellModel {
    let type: CalculatorButton
    var onTap: (() -> Void)?
}

final class ButtonsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ButtonCell"
    
    // Dependency
    private var calculatorButton: CalculatorButton!
        
    // UI Components
    
    let titleLabel = {
        let label = UILabel()
        label.text = "Error"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .regular)
        return label
    }()
    
    //MARK: - Configure
    
    func configure(with model: CalculatorButton) {
        calculatorButton = model
        titleLabel.text = model.title
        titleLabel.textColor = titleColor(model)
        backgroundColor = backgroundColor(model)
        
        setupUI()
        setupLayout()
    }
    
    func configureSelected(with model: CalculatorButton) {
        calculatorButton = model
        titleLabel.text = model.title
        titleLabel.textColor = titleColor(model)
        backgroundColor = selectColor(model)
    }
    
    private func titleColor(_ model: CalculatorButton) -> UIColor {
        switch model {
        case .allClear: return .textCancel
        case .staples, .plusMinus, .percentage, .divide, .multiply, .sustract, .add, .decimal, .number: return .textButton
        case .equals: return .white
        }
    }
    
    private func backgroundColor(_ model: CalculatorButton) -> UIColor {
        switch model {
        case .equals: return .backgroundEqually
        default: return .backgroundButton
        }
    }
    
    private func selectColor(_ model: CalculatorButton) -> UIColor {
        switch model {
        case .allClear, .staples, .plusMinus, .percentage, .divide, .multiply, .sustract, .add, .decimal, .number: return .selectedBackground
        case .equals: return .selectedBackgroundEqually
        }
    }
    
    //MARK: - Setup UI and Setup Layout
    
    private func setupUI() {
        addSubview(titleLabel)
        layer.cornerRadius = 35
    }
    
    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.removeFromSuperview()
    }
    
    // MARK: - highlight кнопки

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        alpha = 0.4
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        alpha = 1
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesCancelled(touches, with: event)
//        alpha = 1
//    }
}
