//
//  Food.swift
//  Luncheon
//
//  Created by arshiya  on 8/10/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation

class Food {

    
    private let id :String
    private let name :String
    private let persianName:String
    private let description:String
    private let menu:String
    private let menuID:Int
    private let quantity:Int
    private let rate:Double
    private let rateCount:Int
    private let commentCount:Int
    private let packingPrice:Int
    private let picAddres:String
    private let discountAmount:Int
    private let dicountPercent:Int
    private let calorie:Int
    private let isCustomizable:Bool
    
    private var ingredient:[Ingredient]
    private var price :Int!
    
    
    internal init(id: String, name: String, persianName: String, description: String, menu: String, menuID: Int, quantity: Int, rate: Double, rateCount: Int, commentCount: Int, packingPrice: Int, picAddres: String, discountAmount: Int, dicountPercent: Int, calorie: Int, isCustomizable: Bool, ingredient: [Ingredient]) {
        self.id = id
        self.name = name
        self.persianName = persianName
        self.description = description
        self.menu = menu
        self.menuID = menuID
        self.quantity = quantity
        self.rate = rate
        self.rateCount = rateCount
        self.commentCount = commentCount
        self.packingPrice = packingPrice
        self.picAddres = picAddres
        self.discountAmount = discountAmount
        self.dicountPercent = dicountPercent
        self.calorie = calorie
        self.isCustomizable = isCustomizable
        self.ingredient = ingredient
    }
    
    
}
