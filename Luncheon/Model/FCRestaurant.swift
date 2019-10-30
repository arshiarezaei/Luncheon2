//
//  FCRestaurant.swift
//  Luncheon
//
//  Created by arshiya  on 7/28/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation
import UIKit

struct FCRestaurant{
    
    private let id :String
    private let name:String
    private let persianName:String
    private let rate:Double
    private let picURL:String 
    private var logo:UIImage =  UIImage(named: "food")!
    private let  menu:[Menu]
    
    var getPersianName: String {
        get {
            self.persianName
        }
    }
  
    var getID: String {
        get {
            return self.id
        }
    }
    var fCRestaurantLogo: UIImage {
        get {
            return self.logo
        }
        set {
            self.logo = newValue
        }
    }
    
    var getRestaurantPicURL:String {
        get {
            return picURL
        }
    }
    var getCountOfMenus: Int {
        get{
            return self.menu.count
        }
    }
    var FCRestaurantMenu: [Menu] {
        get {
            return self.menu
        }
    }
    
    
    init(id:String,name:String,persianName:String,rate:Double,picURL:String) {
        self.id = id
        self.name = name
        self.persianName = persianName
        self.rate = rate
        self.picURL = picURL
        self.menu = []
     
    }
   init(id:String,name:String,persianName:String,rate:Double,picURL:String,menu:[Menu]) {
//    self.init(id:id,name:name,persianName:persianName,rate:rate,picURL:picURL)
    
           self.id = id
           self.name = name
           self.persianName = persianName
           self.rate = rate
           self.picURL = picURL
           self.menu = menu
        
       }
    
   
    func getInfo() -> FCRestaurant {
        return self
    }
    subscript(index:Int)->Menu{
        return self.menu[index]
    }
    
    
}
