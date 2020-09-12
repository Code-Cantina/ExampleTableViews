//
//  SectionHeaderCell.swift
//  scrollingHeaderView
//
//  Created by Danny Copeland on 9/12/20.
//  Copyright © 2020 Danny Copeland. All rights reserved.
//

import UIKit

class SectionHeaderCell: UIView {
    
    let sectionTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let arrowImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "down_arrow"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        self.backgroundColor = .secondarySystemGroupedBackground
        self.addSubview(separator)
        self.addSubview(sectionTitle)
        self.addSubview(arrowImage)
        
        NSLayoutConstraint.activate([
            separator.widthAnchor.constraint(equalTo: self.widthAnchor,constant: -20),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            separator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            sectionTitle.topAnchor.constraint(equalTo: self.topAnchor),
            sectionTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            sectionTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            sectionTitle.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
