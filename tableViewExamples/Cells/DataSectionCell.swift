//
//  DataSectionCell.swift
//  scrollingHeaderView
//
//  Created by Danny Copeland on 9/11/20.
//  Copyright © 2020 Danny Copeland. All rights reserved.
//

import UIKit

class DataSectionCell: UITableViewCell {
    
    let title: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .secondarySystemBackground
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
