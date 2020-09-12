//
//  FeaturedHeaderVC.swift
//  scrollingHeaderView
//
//  Created by Danny Copeland on 9/12/20.
//  Copyright © 2020 Danny Copeland. All rights reserved.
//

/*
 Table view with:
     'featured' top header
     expandable sections
     up/down arrow indicator for section headers
 */

import UIKit

class FeaturedHeaderVC: UIViewController {
    
    //MARK: - Properties
    var dataSections: [DataSection] = []
    
    var isSectionOpen: [Bool]!
    
    let dataCellId = "dataCellId"
    let dataTableView: UITableView = {
        let tbl = UITableView(frame: .zero, style: .plain)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.backgroundColor = .secondarySystemGroupedBackground
        return tbl
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemGroupedBackground
        self.title = "Featured Header"
        
        setupDataTable()
        createMockData()
        
        self.isSectionOpen = Array(repeating: false, count: self.dataSections.count)
    }
    
    //MARK: - Data
    private func createMockData(){
        dataSections = [
            DataSection(title: "AAAAAA", data: ["A1","A2","A3","A4","A5"]),
            DataSection(title: "BBBBBB", data: ["B1","B2","B3","B4","B5", "B6"]),
            DataSection(title: "CCCCCC", data: ["C1","C2","C3","C4","C5", "C6", "C7"]),
            DataSection(title: "DDDDDD", data: ["D1","D2","D3","D4","D5", "D6"]),
            DataSection(title: "EEEEEE", data: ["E1","E2","E3","E4","E5"]),
            DataSection(title: "FFFFFF", data: ["F1","F2","F3","F4","F5", "F6", "F7"]),
            DataSection(title: "GGGGGG", data: ["G1","G2","G3","G4","G5", "G6", "G7", "G8"]),
            DataSection(title: "HHHHHH", data: ["H1","H2","H3","H4","H5"]),
            DataSection(title: "IIIIII", data: ["I1","I2","I3","I4","I5"]),
            DataSection(title: "JJJJJJ", data: ["J1","J2","J3","J4","J5"]),
        ]
    }
    
    //MARK: - Setup
    private func setupDataTable() {
        dataTableView.register(DataSectionCell.self, forCellReuseIdentifier: dataCellId)
        dataTableView.dataSource = self
        dataTableView.delegate = self
        
        view.addSubview(dataTableView)
        
        NSLayoutConstraint.activate([
            dataTableView.topAnchor.constraint(equalTo: view.topAnchor),
            dataTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dataTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

//MARK: - Table View Delegates
extension FeaturedHeaderVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSections.count + 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "" : dataSections[section - 1].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section > 0 {
            if isSectionOpen.count >= section {
                if(isSectionOpen[section - 1]) {
                    return self.dataSections[section - 1].data.count
                }
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let brand = dataSections[indexPath.section - 1].data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: dataCellId, for: indexPath as IndexPath) as! DataSectionCell
        cell.title.text = brand
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 125 : 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            //top level header view
            let topHeaderView = UIView()
            topHeaderView.backgroundColor = .systemGreen
            
            return topHeaderView
            
        } else {
            //normal section header view
            let headerSection = dataSections[section - 1]
            let headerView = SectionHeaderCell()
            headerView.sectionTitle.text = headerSection.title
            
            let headerGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(headerTapped))
            headerView.isUserInteractionEnabled = true
            headerView.addGestureRecognizer(headerGestureRecognizer)
            headerView.tag = section
            
            if isSectionOpen.count >= section {
                if isSectionOpen[section - 1] {
                    headerView.arrowImage.transform = CGAffineTransform(rotationAngle: (180 * .pi) / 180)
                }
            }
            
            let xCoord = Int(self.view.frame.width - 40)
            let yCoord = 10
            headerView.arrowImage.frame = CGRect(x: xCoord, y: yCoord, width: 25, height: 25)
            
            return headerView
        }
        
    }
    
    //MARK: - Header Tapped, Show/Hide Section
    @objc func headerTapped(sender: UITapGestureRecognizer) {
        if let linkSection = sender.view {
            let section: Int = linkSection.tag
            if(isSectionOpen[section - 1]) {
                isSectionOpen[section - 1] = false
                self.dataTableView.reloadData()
                
            } else {
                self.isSectionOpen[section - 1] = true
                self.dataTableView.reloadData()
            }
        }
    }
    
}
