//
//  DetailViewController.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 31/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
    private let cakeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Noteworthy-Light ", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Noteworthy-Light ", size: 32)
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noteworthy-Light ", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noteworthy-Light ", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let calorificLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noteworthy-Light ", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let detailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    @objc func exit() {
        dismiss(animated: true, completion: nil)
    }
    
    private let exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(exit), for: .touchUpInside)
        button.setImage(UIImage(named: "cancel"), for: .normal)
        //button.backgroundColor = .blue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .clear
        self.view.addSubview(detailView)
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.insertSubview(blurEffectView, at: 0)
        
        configureInterface()
    }
    
    func configureInterface() {
        
        detailView.addSubview(cakeImageView)
        detailView.addSubview(nameLabel)
        detailView.addSubview(descriptionLabel)
        detailView.addSubview(costLabel)
        detailView.addSubview(calorificLabel)
        detailView.addSubview(weightLabel)
        detailView.addSubview(exitButton)
        
        detailView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        detailView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        detailView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        detailView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 30).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -30).isActive = true
        
        cakeImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        cakeImageView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 30).isActive = true
        cakeImageView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -30).isActive = true
        cakeImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: cakeImageView.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -30).isActive = true

        weightLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
        weightLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 30).isActive = true
        weightLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -30).isActive = true

        calorificLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20).isActive = true
        calorificLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 30).isActive = true
        calorificLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -30).isActive = true
        
        costLabel.topAnchor.constraint(equalTo: calorificLabel.bottomAnchor, constant: 20).isActive = true
        costLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 30).isActive = true
        costLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -30).isActive = true
        
        exitButton.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -20).isActive = true
//        exitButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        exitButton.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 10).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        exitButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }

    func setDetails(withProduct product: Product) {
        
        self.nameLabel.text = product.name
        self.descriptionLabel.text = product.description
        self.costLabel.text = "Cost: \(product.cost) rub."
        self.cakeImageView.image = product.image
        self.calorificLabel.text = "Calorific: \(product.calorific)"
        self.weightLabel.text = "Weight: \(product.weight)"
        
    }
    

}
