//
//  WATableViewCell.swift
//  splitting-view-from-viewcontroller-demo
//
//  Created by Waseem Akram on 14/08/20.
//  Copyright © 2020 Waseem Akram. All rights reserved.
//

import UIKit

typealias WATableViewCell = WATableViewCellBase & WATableViewCellProtocol

protocol WATableViewCellProtocol: class {
    var contentSubViews: [UIView] { get }
    func setupConstraints(for size: CGSize)
}

class WATableViewCellBase: UITableViewCell {
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        guard let view = self as? WATableViewCellProtocol else {
            fatalError("WATableViewCell not implemented")
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
        guard let view = self as? WATableViewCellProtocol else {
            fatalError("WATableViewCell not implemented")
        }
        view.setupConstraints(for: frame.size)
    }
        
    func setupViewsAdditionalConfiguration() {}
    
}
