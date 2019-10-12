//
//  MenuTableViewCell.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 30/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    var tabBarController: UITabBarController?
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noteworthy-Light", size: 20)
        label.text = "Subcategory label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var cakeCV: CakeCollectionView?
    
    func configurateCell(withProducts products: [Product]) {
        cakeCV = CakeCollectionView()
        
        cakeCV!.products = products
        
        addSubview(headerLabel)
        addSubview(cakeCV!)
        
        cakeCV!.tabBarController = self.tabBarController
        
        headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        cakeCV!.topAnchor.constraint(equalTo: self.headerLabel.bottomAnchor, constant: 25).isActive = true
        cakeCV!.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cakeCV!.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cakeCV!.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        cakeCV = nil
    }
}
