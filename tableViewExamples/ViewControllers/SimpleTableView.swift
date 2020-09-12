//
//  SimpleTableView.swift
//  scrollingHeaderView
//
//  Created by Danny Copeland on 9/12/20.
//  Copyright © 2020 Danny Copeland. All rights reserved.
//

import UIKit

class SimpleVC: UIViewController {

    //MARK: - Properties
    var tableOptions: [TableOption] = [ ]
    
    let dataTableCellId = "dataTableCellId"
    let dataTable: UITableView = {
        let tbl = UITableView(frame: .zero, style: .plain)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        self.title = "Simple Table View"
        
        setupTableData()
        setupTable()
    }
    
    //MARK: - Data
    private func setupTableData() {
        tableOptions = [
           // TableOption(name: "Simple", viewController: SimpleTableView()),
            TableOption(name: "Sections", viewController: SectionsVC()),
            TableOption(name: "Collapsing Sections", viewController: ExpandingSectionsVC()),
            TableOption(name: "Top Header", viewController: FeaturedHeaderVC()),
            TableOption(name: "Searching", viewController: SearchingTableView()),
            TableOption(name: "Dragable", viewController: SimpleVC()),
        ]
    }
    
    //MARK: - Setup
    private func setupTable() {
        dataTable.dataSource = self
        dataTable.delegate = self
        dataTable.register(DataSectionCell.self, forCellReuseIdentifier: dataTableCellId)
        
        view.addSubview(dataTable)
        
        NSLayoutConstraint.activate([
            dataTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dataTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dataTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dataTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
}

//MARK: - Table View Delegates
extension SimpleVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dataTableCellId, for: indexPath) as! DataSectionCell
        let dataObject = tableOptions[indexPath.row]
        cell.title.text = dataObject.name
        cell.title.textColor = .systemGreen
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataObject = tableOptions[indexPath.row]
        self.navigationController?.pushViewController(dataObject.viewController, animated: true)
    }
    
}
