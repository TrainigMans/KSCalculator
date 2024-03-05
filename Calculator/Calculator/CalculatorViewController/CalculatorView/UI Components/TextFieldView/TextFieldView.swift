//
//  TextFieldView.swift
//  Calculator
//
//  Created by Evgenij Polubin on 01.03.2024.
//

import UIKit

struct TextFieldViewModel {
    var text: String
}

final class TextFieldView: UIView {
        
    private lazy var textField = {
        let textField = UITextField()
        textField.delegate = self
        textField.textColor = .textButton
        textField.tintColor = .textButton
        textField.textAlignment = .right
        textField.backgroundColor = .clear
        textField.font = .systemFont(ofSize: 30)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: TextFieldViewModel) {
        textField.text = model.text
    }
    
    private func setupUI() {
        addSubview(textField)
    }
    
    private func setupLayout() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension TextFieldView: UITextFieldDelegate {}
