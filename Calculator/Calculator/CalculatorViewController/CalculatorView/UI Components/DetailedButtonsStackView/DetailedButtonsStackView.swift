//
//  DetailedButtonsStackView.swift
//  Calculator
//
//  Created by Evgenij Polubin on 01.03.2024.
//

import UIKit

final class DetailedButtonsStackView: UIView {
    
    // UI Components
    private let stackView = UIStackView()
    
    private func makeButtons(_ stack: UIStackView, image: [UIImage]) {
        var image = image
        
        for _ in 1...3 {
            let button = UIButton()
            button.setImage(image.first ?? .actions, for: .normal)
            button.contentVerticalAlignment = .fill
            button.contentHorizontalAlignment = .fill
            button.imageView?.tintColor = .textButton
            image.removeFirst()
            
            stack.spacing = 40
            stack.addArrangedSubview(button)
            
            button.widthAnchor.constraint(equalToConstant: 23).isActive = true
            button.heightAnchor.constraint(equalToConstant: 23).isActive = true
        }
    }
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageView?.tintColor = .textButton
        
        button.widthAnchor.constraint(equalToConstant: 23).isActive = true
        button.heightAnchor.constraint(equalToConstant: 23).isActive = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: DetailedButtonsStackViewModel) {
        makeButtons(stackView, image: model.image)
        stackView.setCustomSpacing(150, after: stackView.arrangedSubviews.last ?? UIView())
        deleteButton.setImage(model.image.last, for: .normal)
        stackView.addArrangedSubview(deleteButton)
    }
    
    private func setupUI() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
}

