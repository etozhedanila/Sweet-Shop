//
//  MenuTableViewController.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 30/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    let content = [[sweetPies, pies], [cakes], [littleCakes], [doughnuts, berliners, donuts]]
    let sections = ["Пироги","Торты","Пирожные","Пончики"]
    let sectionsContent = [["Сладкие пироги","Несладкие пироги"],["Просто вкусные тортики"],["Просто вкусные пирожные"],["Традиционные пончики","Берлинеры","Донатсы"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false

        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = .black
        
        tableView.separatorInset.left = 0
        
        tableView.sectionHeaderHeight = 100
        
        tableView.rowHeight = 400
        
        self.tableView.backgroundColor = #colorLiteral(red: 1, green: 0.3881212175, blue: 0.4598540068, alpha: 1)
        
//        if let tabItems = tabBarController?.tabBar.items {
//            // In this case we want to modify the badge number of the third tab:
//            let tabItem = tabItems[0]
//            tabItem.badgeValue = "1"
//            
//        }
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 100))
        let headerLabel = UILabel(frame: CGRect(x: 20, y: 40, width: self.tableView.frame.width, height: 50))
        headerLabel.text = sections[section]
        headerLabel.font = UIFont(name: "Noteworthy-Bold", size: 35)
        headerView.backgroundColor = #colorLiteral(red: 1, green: 0.3881212175, blue: 0.4598540068, alpha: 1)
        headerView.addSubview(headerLabel)
        print(section)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionsContent[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell

        cell.tabBarController = self.tabBarController
        
        cell.headerLabel.text = sectionsContent[indexPath.section][indexPath.row]
        
        cell.configurateCell(withProducts: content[indexPath.section][indexPath.row])
       
        cell.backgroundColor = #colorLiteral(red: 1, green: 0.3881212175, blue: 0.4598540068, alpha: 1)

        return cell
    }
    
}
