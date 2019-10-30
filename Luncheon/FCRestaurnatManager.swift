//
//  FCManager.swift
//  Luncheon
//
//  Created by arshiya  on 7/29/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation
import UIKit

class FCRestaurnatManager {
    static private var fcRes = [FCRestaurant]()
    static var count: Int {
        get {
            return fcRes.count
        }
    }
    static func getRestaurantsOfAFC(fCid:String,compeletion:@escaping ()->Void) {
        Networking.getRestaurantsOFAFoodCourt(foodCourtID: "11800a16-1148-49fb-8dc2-317c2b45e48c"){
            json in
            //            var fcrestaurants:[FCRestaurant]=[]
            for (index,_)  in  json.enumerated() {
                let item = json[index]
                let id = item["id"].stringValue
                let name = item["name"].stringValue
                let persianName = item["persianName"].stringValue
                let rate = item["rate"].doubleValue
                let  picURL:String = String(item["picture"].stringValue.dropFirst())
                //let   let JsonMenu = (item["menus"]).array
                var menu:[Menu]=[]
                if let JsonMenu = (item["menus"]).array{
                    
                    for (index,_) in JsonMenu.enumerated() {
                        let NewMenuObject = JsonMenu[index]
                    let id = NewMenuObject["id"].stringValue
                    let name = NewMenuObject["name"].stringValue
                    let persianName = NewMenuObject["persianName"].stringValue
                    let newMenu = Menu(id: id, name: name, persianName: persianName)
                    menu.append(newMenu)
                }
                  
                }
                
            let   restaurant = FCRestaurant(id: id, name: name, persianName: persianName, rate: rate, picURL: picURL,menu: menu)
                
                fcRes.append(restaurant)
                compeletion()
                
                
                //                    debugPrint(restaurant)
                //                    restaurant.fCRestaurantLogo = image
                //                    fcRes.append(restaurant)
                //                    compeletion()
            }
            for (index,_) in fcRes.enumerated(){
                let id = fcRes[index].getID;
                let picAddress = fcRes[index].getRestaurantPicURL
                Networking.getFCRestaurantPic(fCRestaurantid: id, picAddress: picAddress){
                    image in
                    fcRes[index].fCRestaurantLogo = image
                    compeletion()
                }
            }
          
        }
    
        
        
    }
    
    static func AddNewRestaurnst(fCRestaurant:FCRestaurant)  {
        fcRes.append(fCRestaurant)
    }
    static func getRest(index:Int) -> FCRestaurant! {
        return fcRes[index]
    }
    static func addPicToFCRestaurant(id:String,picURL:String,completionn:@escaping ()->Void)  {
        var logo:UIImage = UIImage()
        Networking.getFCRestaurantPic(picAddress: picURL){
            image in
            logo = image
            completionn()
        }
        for item in fcRes.enumerated() {
            if item.element.getID == id{
                fcRes[item.offset].fCRestaurantLogo = logo
            }
        }
    }
}
