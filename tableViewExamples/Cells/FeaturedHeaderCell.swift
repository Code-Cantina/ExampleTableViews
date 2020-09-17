//
//  FeaturedHeaderCell.swift
//  scrollingHeaderView
//
//  Created by Danny Copeland on 9/12/20.
//  Copyright © 2020 Danny Copeland. All rights reserved.
//

import UIKit

class FeaturedHeaderCell: UIView {
    
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.showsCancelButton = true
        return search
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        self.backgroundColor = .secondarySystemGroupedBackground
       
        self.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
