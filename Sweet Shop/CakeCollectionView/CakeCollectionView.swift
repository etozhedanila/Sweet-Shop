//
//  CakeCollectionView.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 29/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class CakeCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var tabBarController: UITabBarController?
    
    //let products: [Product] = cakes
    var products: [Product] = []
    
    var cartTableViewController: CartTableViewController?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.delegate = self
        self.dataSource = self
        
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing

        translatesAutoresizingMaskIntoConstraints = false
        
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        
        register(CakeCollectionViewCell.self, forCellWithReuseIdentifier: CakeCollectionViewCell.reuseId)
        

        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell selected")
        
        let detailVC = DetailViewController()
        detailVC.setDetails(withProduct: products[indexPath.row])
        
        detailVC.modalTransitionStyle = .flipHorizontal
        detailVC.modalPresentationStyle = .overCurrentContext
        
        let menuNVC = tabBarController?.viewControllers![0]  as! UINavigationController
        let menuTVC = menuNVC.viewControllers[0] as! MenuTableViewController
        
        menuTVC.present(detailVC, animated: true, completion: nil)
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CakeCollectionViewCell.reuseId, for: indexPath) as! CakeCollectionViewCell
        
        cell.tabBarController = tabBarController
        
        cell.configureInterface(withProduct: products[indexPath.row])
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Constants.galleryItemWidth, height: frame.height * 0.8)
    }
    
}
