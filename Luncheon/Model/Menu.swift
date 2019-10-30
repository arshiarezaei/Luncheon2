//
//  Menu.swift
//  Luncheon
//
//  Created by arshiya  on 7/30/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation
struct Menu {
    
    private let id :String
    private let name :String
    private let persianName:String
    
    var getMenuTitle: String {
        get {
            return name
        }
    }
    var getMenuPersianName: String {
        get {
            return persianName
        }
      
    }
    init(id:String,name:String,persianName:String) {
        self.name = name
        self.persianName = persianName
        self.id = id
    }
}
