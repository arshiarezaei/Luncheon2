//
//  Menu.swift
//  Luncheon
//
//  Created by arshiya  on 7/30/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation
struct Menu {
    
    private let title :String
    private let persianTitle:String
    
    var getMenuTitle: String {
        get {
            return title
        }
    }
    var getMenuPersianName: String {
        get {
            return persianTitle
        }
      
    }
    init(title:String,persianTitle:String) {
        self.title = title
        self.persianTitle = persianTitle
    }
}
