//
//  SeparatingLineView.swift
//  Calculator
//
//  Created by Evgenij Polubin on 01.03.2024.
//

import UIKit

// Нарочно нарушаю принцип программирования KISS, чтобы показать умение работать с UIBezierPath

final class SeparatingLineView: UIView {
    
    private lazy var separatingLine = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 15))
        path.addLine(to: CGPoint(x: 380, y: 15))
        let shapeLayer = CAShapeLayer()
        layer.addSublayer(shapeLayer)
        shapeLayer.lineWidth = 1
        shapeLayer.strokeColor = UIColor.separatedLine.cgColor
        shapeLayer.path = path.cgPath
        return shapeLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.addSublayer(separatingLine)
    }
}
