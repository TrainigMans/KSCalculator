//
//  DeleteButton.swift
//  Calculator
//
//  Created by Evgenij Polubin on 01.03.2024.
//

import UIKit

final class DeleteButtonView: UIView {
    
     var tapAction: () -> Void = {}
    
    private lazy var button = {
        let button = UIButton()
        button.setImage(.detailedButtonsImage.delete, for: .normal)
        button.imageView?.tintColor = .textButton
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayput()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(button)        
    }
    
    private func setupLayput() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
