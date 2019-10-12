//
//  CakeCollectionViewCell.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 29/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class CakeCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CakeCell"
    
    private let cakeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Noteworthy-Light ", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Noteworthy-Light ", size: 24)
        
        return label
    }()
    
    var tabBarController: UITabBarController?

    var product: Product?
    
    @objc func addToCart() {
    
        
        guard let product = fetchProduct() else {
            print("error")
            return
        }
        Product.addToCart(product: product)
        let cartNVC = tabBarController?.viewControllers![1]  as! UINavigationController
        let cartTVC = cartNVC.viewControllers[0] as! CartTableViewController
        cartTVC.tableView.reloadData()
        
    }
    
    let cartButton: UIButton = {
        let button = UIButton()

        button.setImage(UIImage(named: "cart-1"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        //button.isUserInteractionEnabled = true
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.showsTouchWhenHighlighted = true
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.shadowColor = UIColor.black.cgColor
        
        //button.adjustsImageWhenHighlighted = true
        return button
    }()
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(cakeImageView)
        self.addSubview(nameLabel)
        self.addSubview(costLabel)
        //self.contentView.addSubview(cartButton)
        self.addSubview(cartButton)
    
        cakeImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cakeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cakeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cakeImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: cakeImageView.bottomAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        costLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        costLabel.topAnchor.constraint(equalTo: cakeImageView.bottomAnchor, constant: 80).isActive = true
        
        cartButton.centerYAnchor.constraint(equalTo: costLabel.centerYAnchor).isActive = true
        cartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        cartButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cartButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.bringSubviewToFront(cartButton)
        
    }
    
    override func layoutSubviews() {
        
        self.layer.cornerRadius = 5
        //self.clipsToBounds = true
        self.backgroundColor = .white
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.layer.borderWidth = 2
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.5
        //self.clipsToBounds = false
    }
    
    func configureInterface(withProduct product: Product) {
        self.product = product
        cartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        self.nameLabel.text = product.name
        self.cakeImageView.image = product.image!
        self.costLabel.text = "\(product.cost) rub."
        
    }
    
    func fetchProduct() -> Product? {
        guard let product = self.product else {
            return nil
        }
        return product

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        //self.product = nil
    }
}
