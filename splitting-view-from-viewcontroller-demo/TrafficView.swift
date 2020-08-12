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

class TrafficView: UIView {
    
    private let holdingStackView = UIStackView()
    private let redButton = UIButton()
    private let yellowButton = UIButton()
    private let greenButton = UIButton()
    
    weak var delegate: TrafficViewDelegate? = nil
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews(){
        
        //setup buttons
        redButton.setTitle("Red", for: .normal)
        redButton.setTitleColor(.systemRed, for: .normal)
        redButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(redButtonTapped(_:))))
        
        yellowButton.setTitle("Yellow", for: .normal)
        yellowButton.setTitleColor(.systemYellow, for: .normal)
        yellowButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(yellowButtonTapped(_:))))
        
        greenButton.setTitle("Green", for: .normal)
        greenButton.setTitleColor(.systemGreen, for: .normal)
        greenButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(greenButtonTapped(_:))))
        
        // add to stackview
        holdingStackView.addArrangedSubview(redButton)
        holdingStackView.addArrangedSubview(yellowButton)
        holdingStackView.addArrangedSubview(greenButton)
        
        //setup stackview
        holdingStackView.axis = .vertical
        holdingStackView.distribution = .fillEqually
        holdingStackView.backgroundColor = .red
        
        //add to view
        addSubview(holdingStackView)
        
        //setup constraints
        setupConstraints()
    }
    
    func setupConstraints(){
        holdingStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            holdingStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            holdingStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            holdingStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            holdingStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            holdingStackView.heightAnchor.constraint(equalToConstant: 250)
        ])
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
