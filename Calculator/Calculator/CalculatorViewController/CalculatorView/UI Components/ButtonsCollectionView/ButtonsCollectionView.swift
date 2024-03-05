//
//  ButtonsCollectionView.swift
//  Calculator
//
//  Created by Evgenij Polubin on 29.02.2024.
//

import UIKit

final class ButtonsCollectionView: UIView {
    
    var tapAction: (Void?) -> Void = { _ in }
    
    private var model: [CalculatorButtonCellModel] = []
    
    func configure(with model: [CalculatorButtonCellModel]) {
        self.model = model
        buttonsCollectionView.reloadData()
    }
                
    private lazy var buttonsCollectionView = {
        let layout = UICollectionViewFlowLayout()        
        let buttonsCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        buttonsCollection.delegate = self
        buttonsCollection.dataSource = self
        buttonsCollection.backgroundColor = .clear
        buttonsCollection.register(ButtonsCollectionViewCell.self, forCellWithReuseIdentifier: ButtonsCollectionViewCell.identifier)
        return buttonsCollection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup
    private func setupUI() {
        addSubview(buttonsCollectionView)
    }
    
    private func setupLayout() {
        buttonsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsCollectionView.topAnchor.constraint(equalTo: topAnchor),
            buttonsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension ButtonsCollectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.map(\.type).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonsCollectionViewCell.identifier, for: indexPath) as! ButtonsCollectionViewCell
        cell.configure(with: model.map(\.type)[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: frame.width/5, height: frame.width/5)
    }
    
    //MARK: - Action
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapAction(model[indexPath.row].onTap?())
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {        
        if let cell = collectionView.cellForItem(at: indexPath) as? ButtonsCollectionViewCell {
            cell.configureSelected(with: model.map(\.type)[indexPath.row]) 
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ButtonsCollectionViewCell {
            cell.configure(with: model.map(\.type)[indexPath.row]) 
        }
    }
}
