//
//  Constants.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 29/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

struct Constants {
    static let leftDistanceToView: CGFloat = 20
    static let rightDistanceToView: CGFloat = 20
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
}
