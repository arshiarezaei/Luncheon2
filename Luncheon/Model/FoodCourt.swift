//
//  FoodCourt.swift
//  Luncheon
//
//  Created by arshiya  on 7/28/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation
import UIKit

struct FoodCourt {
    
    private let id :String
    private let name:String
    private let persianName:String
    private let rate:Double
    private let restaurants:[FCRestaurant]
    
    init(id:String,name:String,persianName:String,rate:Double) {
        self.id = id
        self.name = name
        self.persianName = persianName
        self.rate = rate
        self.restaurants = []
        
    }
    init(id:String,name:String,persianName:String,rate:Double,restaurants:[FCRestaurant]) {
         self.id = id
         self.name = name
         self.persianName = persianName
         self.rate = rate
         self.restaurants = restaurants
         
     }
    
    
    
}
