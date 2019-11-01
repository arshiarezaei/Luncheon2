//
//  Ingredients.swift
//  Luncheon
//
//  Created by arshiya  on 8/10/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation


struct Ingredient {
    
    private let id:Int
    private let name:String
    private let defaultValue:Int
    private let minValue:Int
    private let maxValue:Int
    private let price:Int
    private var value:Int!
    
    
    
    init(id: Int, name: String, defaultValue: Int, minValue: Int, maxValue: Int, price: Int) {
        self.id = id
        self.name = name
        self.defaultValue = defaultValue
        self.minValue = minValue
        self.maxValue = maxValue
        self.price = price
    
    }

    
    
}
