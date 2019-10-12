//
//  AboutUsTableViewController.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 30/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class AboutUsTableViewController: UITableViewController {
    
    let cellIdentifier = "aboutUsCell"
    let segueIdentifier = "aboutSegue"
    
    let sections = ["E-mails", "Social networks", "Phones"]
    
    let sectionsContent = [["bogdanovic2014@yandex.ru", "vitaly_subbotin@mail.ru"], ["Вконтакте директора", "Вконтакте разработчика", "Instagram"], ["+79774610036", "+79032710206"]]
    
    let links = ["https://vk.com/choco_fat","https://vk.com/etozhedanilaa", "https://www.instagram.com/"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView(frame: .zero)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionsContent[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        cell.textLabel?.text = sectionsContent[indexPath.section][indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            performSegue(withIdentifier: segueIdentifier, sender: self)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! WebViewController
                dvc.url = URL(string: links[indexPath.row])
            }
        }
    }

}
