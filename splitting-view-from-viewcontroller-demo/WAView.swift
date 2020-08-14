//
//  WAView.swift
//  splitting-view-from-viewcontroller-demo
//
//  Created by Waseem Akram on 14/08/20.
//  Copyright © 2020 Waseem Akram. All rights reserved.
//

import UIKit

typealias WAView = WAViewBase & WAViewProtocol

protocol WAViewProtocol: class {
    var contentSubViews: [UIView] { get }
    func setupConstraints(for size: CGSize)
}

class WAViewBase: UIView {
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let view = self as? WAViewProtocol else {
            fatalError("WAView not implemented")
        }
        
        view.contentSubViews.forEach {
            addSubview($0)
        }
        setupViewsAdditionalConfiguration()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        guard let view = self as? WAViewProtocol else {
            fatalError("WAView not implemented")
        }
        view.setupConstraints(for: frame.size)
    }
        
    func setupViewsAdditionalConfiguration() {}
    
}
