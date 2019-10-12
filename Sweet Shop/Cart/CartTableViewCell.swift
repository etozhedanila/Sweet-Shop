//
//  CartTableViewCell.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 31/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let reuseId = "cartCell"
    
    private var product: Product?
    
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
        label.font = UIFont(name: "Noteworthy-Light", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Noteworthy-Light", size: 17)
        
        return label
    }()
    
    private var count = 1 {
        didSet {
            guard let product = product else {
                print("error")
                return
            }
            countLabel.text = "Количество: \(count)"
            costLabel.text = "\(String(describing: product.cost * count)) rub."
        }
    }
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Количество: 1"
        label.font = UIFont(name: "Noteworthy-Light", size: 13)
        return label
    }()
    
    private let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 1
        stepper.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.4745098039, blue: 0.9294117647, alpha: 1)
        stepper.tintColor = .black
        return stepper
    }()

    @objc func changeCount() {
        self.count = Int(stepper.value)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(withProduct product: Product) {
        self.product = product
        
        configureInterface()
        
        self.addSubview(nameLabel)
        self.addSubview(costLabel)
        self.addSubview(cakeImageView)
        self.addSubview(countLabel)
        self.addSubview(stepper)
        
        stepper.addTarget(self, action: #selector(changeCount), for: .touchUpInside)
        
        cakeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        cakeImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        cakeImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        cakeImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        costLabel.bottomAnchor.constraint(equalTo: cakeImageView.bottomAnchor).isActive = true
        costLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        stepper.bottomAnchor.constraint(equalTo: cakeImageView.bottomAnchor).isActive = true
        stepper.leadingAnchor.constraint(equalTo: cakeImageView.trailingAnchor, constant: 10).isActive = true
        
        countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: costLabel.topAnchor, constant: -5).isActive = true
    }
    
    private func configureInterface() {
        guard let product = product else {
            print("error")
            return
        }
        self.nameLabel.text = product.name
        self.costLabel.text = "\(String(describing: product.cost)) rub."
        self.cakeImageView.image = product.image
    }

}
