//
//  TableViewCellImplementation.swift
//  splitting-view-from-viewcontroller-demo
//
//  Created by Waseem Akram on 14/08/20.
//  Copyright © 2020 Waseem Akram. All rights reserved.
//

import UIKit

class TableViewCellImplementation:WATableViewCell {
    
    let title = UILabel()
    
    var contentSubViews: [UIView] {
        [title]
    }
    
    func setupConstraints(for size: CGSize) {
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        
    }

    override func prepareForReuse() {
        title.text = ""
    }
    
}

