//
//  SectionsVC.swift
//  scrollingHeaderView
//
//  Created by Danny Copeland on 9/12/20.
//  Copyright © 2020 Danny Copeland. All rights reserved.
//

import UIKit

class SectionsVC: UIViewController {

    //MARK: - Properties
    var dataSections: [DataSection] = []
    
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
        self.title = "Sections Table View"
        createMockData()
        setupTable()
        
    }
    
    //MARK: - Data
    private func createMockData(){
        dataSections = [
            DataSection(title: "One", data: ["One-One", "One-Two", "One-Three", "One-Four", "One-Five", "Once-Six"]),
            DataSection(title: "Two", data: ["Two-One", "Two-Two", "Two-Three", "Two-Four", "Two-Five"]),
            DataSection(title: "Three", data: ["Three-One", "Three-Two", "Three-Three", "Three-Four", "Three-Five"]),
            DataSection(title: "Four", data: ["Four-One", "Four-Two", "Four-Three", "Four-Four", "Four-Five"]),
            DataSection(title: "Five", data: ["Five-One", "Five-Two", "Five-Three", "Five-Four", "Five-Five"]),
            DataSection(title: "Six", data: ["Six-One", "Six-Two", "Six-Three", "Six-Four", "Six-Five"]),
            DataSection(title: "Seven", data: ["Seven-One", "Seven-Two", "Seven-Three", "Seven-Four", "Seven-Five"]),
            DataSection(title: "Eight", data: ["Eight-One", "Eight-Two", "Eight-Three", "Eight-Four", "Eight-Five"]),
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
extension SectionsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSections[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dataTableCellId, for: indexPath) as! DataSectionCell
        let dataObject = dataSections[indexPath.section].data[indexPath.row]
        cell.title.text = dataObject
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerSection = dataSections[section]
        let cellHeaderView = UIView()
        cellHeaderView.backgroundColor = .systemGreen
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = headerSection.title
        
        cellHeaderView.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: cellHeaderView.topAnchor),
            title.leadingAnchor.constraint(equalTo: cellHeaderView.leadingAnchor, constant: 8),
            title.trailingAnchor.constraint(equalTo: cellHeaderView.trailingAnchor, constant: -8),
            title.bottomAnchor.constraint(equalTo: cellHeaderView.bottomAnchor),
        ])
        
        return cellHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
