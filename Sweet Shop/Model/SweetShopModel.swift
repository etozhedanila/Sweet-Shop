//
//  SweetShopModel.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 29/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit



struct Product {
    
    private static var cart: [Product] = []
    
    let name: String
    let description: String
    let cost: Int
    let image: UIImage?
    let weight: Int
    let calorific: Int
    
    init(name: String, description: String, cost: Int, imageString: String, weight: Int, calorific: Int) {
        self.name = name
        self.description = description
        self.cost = cost
        self.image = UIImage(named: imageString)
        self.weight = weight
        self.calorific = calorific
    }
    
    
    static func fetchCart() -> [Product] {
        return cart
    }
    
    static func addToCart(product: Product) {
        cart.append(product)
//        UserDefaults.standard.setValue(cart, forKey: "cart")
//        //UserDefaults.standard.set(cart, forKey: "cart")
//        UserDefaults.standard.synchronize()
    }
    
    static func removeFromCart(at index: Int) {
        cart.remove(at: index)
    }
    
    
//    static func removeFromCart(product: Product) {
//
//
//    }
}




let sweetPies: [Product] = [

    Product(name: "Пирог с черникой", description: "Авторский пирог с черникой ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Шарлотка с яблоком", description: "Авторский пирог \"Шарлотка\" с яблоком ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Лимонный пирог", description: "Авторский Лимонный пирог ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Пирог с маком", description: "Авторский пирог с маком ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Штрудель с вишней", description: "Авторский пирог \"Штрудель\" с вишней ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Штрудель с яблоком", description: "Авторский пирог \"Штрудель\" с яблоком ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
]

let pies: [Product] = [

    Product(name: "Пирог с мясом", description: "Авторский пирог с мясом ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Пирог с рыбой", description: "Авторский пирог с рябой ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Пирог с капустой", description: "Авторский пирог с капустой ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Пирог с грибами", description: "Авторский пирог с грибами ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400)
]

let cakes: [Product] = [
    Product(name: "Тирамису", description: "Авторский торт \"Тирамису\" ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Чизкейк", description: "Авторское торт \"Чизкейк\" ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "", description: "Авторское торт \"Берлинское\" ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400)
]



let littleCakes: [Product] = [
    Product(name: "Картошка", description: "Авторское пирожное \"Картошка\" ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Эклер", description: "Авторское пирожное \"Эклер\" ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Берлинское", description: "Авторское пирожное \"Берлинское\" ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Кольцо с творогом", description: "Авторское пирожное \"Кольцо с творогом\" ручной работы", cost: 250, imageString: "Cake", weight: 75, calorific: 400)
]

let doughnuts: [Product] = [
    Product(name: "Пончик", description: "Традиционный пончик из мягкого воздушного теста", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Пончик-кольцо", description: "Традиционный пончик из мягкого воздушного теста в виде кольца", cost: 250, imageString: "Cake", weight: 75, calorific: 400)
]

let berliners: [Product] = [

    Product(name: "Клубничный берлинер", description: "Берлинер с глазурью и клубничной начинкой", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Шоколадный Берлинер", description: "Берлинер с шоколадной начинкой", cost: 250, imageString: "Cake", weight: 75, calorific: 400)
]

let donuts: [Product] = [
    Product(name: "Донатс", description: "Донатс с шоколадной глазурью", cost: 250, imageString: "Cake", weight: 75, calorific: 400),
    Product(name: "Донатс", description: "Донатс с карамельной глазурью", cost: 250, imageString: "Cake", weight: 75, calorific: 400)
]

