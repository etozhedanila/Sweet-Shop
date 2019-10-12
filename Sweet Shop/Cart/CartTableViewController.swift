//
//  CartTableViewController.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 30/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    let reuseIdentifier = CartTableViewCell.reuseId
    let segueIdentifier = "showOrderVC"

    
    @IBAction func placeOrderButtonTapped(_ sender: Any) {
        print("placeOrderButton Tapped")
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    @IBOutlet weak var placeOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.separatorColor = .black
        
        tableView.rowHeight = 100
        
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Product.fetchCart().count > 0 {
            if let tabBarItem = tabBarController?.tabBar.items![1] {
                tabBarItem.badgeValue = "\(Product.fetchCart().count)"
            }
        }
        return Product.fetchCart().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CartTableViewCell
        
        cell.configureCell(withProduct: Product.fetchCart()[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        detailVC.setDetails(withProduct: Product.fetchCart()[indexPath.row])
        
        detailVC.modalTransitionStyle = .flipHorizontal
        detailVC.modalPresentationStyle = .overCurrentContext
        
        present(detailVC, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            Product.removeFromCart(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
