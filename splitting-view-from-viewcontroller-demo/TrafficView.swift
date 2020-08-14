//
//  TrafficView.swift
//  splitting-view-from-viewcontroller-demo
//
//  Created by Waseem Akram on 12/08/20.
//  Copyright © 2020 Waseem Akram. All rights reserved.
//

import UIKit

protocol TrafficViewDelegate:class {
    func redButtonTapped()
    func yellowButtonTapped()
    func greenButtonTapped()
}

class TrafficView: WAView {
    
    private let holdingStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .red
        return stackView
    }()
    
    
    private let redButton:UIButton = {
        
        $0.setTitle("Red", for: .normal)
        $0.setTitleColor(.systemRed, for: .normal)
        return $0
        
    }(UIButton())
    
    private let yellowButton:UIButton = {
        let button = UIButton()
        button.setTitle("Yellow", for: .normal)
        button.setTitleColor(.systemYellow, for: .normal)
        return button
    }()
    
    
    private let greenButton:UIButton = {
        let button = UIButton()
        button.setTitle("Green", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        return button
    }()
    
    weak var delegate: TrafficViewDelegate? = nil
       
    var contentSubViews: [UIView] {
        [holdingStackView]
    }
    
    func setupConstraints(for size: CGSize) {
        holdingStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            holdingStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            holdingStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            holdingStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            holdingStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            holdingStackView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    override func setupViewsAdditionalConfiguration() {
        
        //setup gesture recognizer
        redButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(redButtonTapped(_:))))
        yellowButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(yellowButtonTapped(_:))))
        greenButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(greenButtonTapped(_:))))
        
        // add to stackview
        holdingStackView.addArrangedSubview(redButton)
        holdingStackView.addArrangedSubview(yellowButton)
        holdingStackView.addArrangedSubview(greenButton)
        
    }
    
    @objc private func redButtonTapped(_ sender:UITapGestureRecognizer){
        delegate?.redButtonTapped()
    }
    
    @objc private func yellowButtonTapped(_ sender:UITapGestureRecognizer){
        delegate?.yellowButtonTapped()
    }
    
    @objc private func greenButtonTapped(_ sender:UITapGestureRecognizer){
        delegate?.greenButtonTapped()
    }
}
