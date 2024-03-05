//
//  LabelView.swift
//  Calculator
//
//  Created by Evgenij Polubin on 01.03.2024.
//

import UIKit

struct LabelViewModel {
    var text: String
}

final class LabelView: UIView {
    
    var text: String? = "11"
        
    private lazy var label = {
        let label = UILabel()
        label.textColor = .textLabel
        label.textAlignment = .right
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: LabelViewModel) {
        label.text = model.text
    }
    
    private func setupUI() {
        addSubview(label)
    }
    
    private func setupLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
