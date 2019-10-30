//
//  Networking.swift
//  Luncheon
//
//  Created by arshiya  on 7/28/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class Networking {
    
    private static let foodCourtBaseURL:URL = URL(string: "http://81.31.168.254:8080/api/api/v1/food-courts/")!
    private static let baseURL : URL = URL(string: "http://81.31.168.254:8080/api/")!
    private static let fcRestauranBasetUrl :(String)->URL = { id in
        var fcRestUrl:URL =  URL(string: "http://81.31.168.254:8080/api/api/v1/fc/restaurants")!
        fcRestUrl = fcRestUrl.appendingPathComponent(id)
        fcRestUrl = fcRestUrl.appendingPathComponent("menus")
        return fcRestUrl
        
    }
    
    private static let headers: HTTPHeaders = [
             "Authorization": "Bearer eyJhbGciOiJSUzI1NiJ9.eyJhdWQiOlsiYXBpIl0sInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsiUk9MRV9MdW5jaGVvbkFkbWluIl0sImV4cCI6MTU3MTc4ODQxNSwidXNlcklkIjoiY2JkM2Y5MGUtODNiNi00MDY0LTlhNGEtNGMxYTE0NzM2ZDA0IiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9MdW5jaGVvbkFkbWluIiwiUk9MRV9SZXN0YXVyYW50QWRtaW4iLCJST0xFX1VzZXIiXSwianRpIjoiN2YzOWEwMzMtMjZlNC00NDkwLTg0MjQtM2IwNzg2ZTZmNjQyIiwiY2xpZW50X2lkIjoiYWRtaW5hcHAifQ.vXKPSeFLt2GmI8IjY6VQZAQXgqSnKAl9BEljz2jxpy8RwOF5c4yJucRJoK73RIcTH6Nk0bKEM0tZ_MCr2LOusgugutEH0E1ykdmDNrN5rD-BCmVyeoTFxIba6gBkQ3WE70N8BuH76nLTrPm7eq6V4SAVZbk-q_RIqeLUH1K9OLBsqMbZf3cPbyv75b5U71KQFwFy6p4pDCICb0LW4Sgdyg7rdO4ksTGGhK4wCk0v-ySy-KDDl-1uUga-8OYvi43Gozkddh9dW-4_-OcMcKUvb81xoLFE1bVSJZtLUeaRFW5DHcoHd9-Ssn8x1w_cTWlVdkZ1QtbIZX-l1_zoh4M9PA",
             "Accept": "application/json"
         ]
    static func getRestaurantsOFAFoodCourt(foodCourtID:String,completion: @escaping (JSON)->Void) {
        var  url = foodCourtBaseURL.appendingPathComponent(foodCourtID)
        url = url.appendingPathComponent("restaurants")
        Alamofire.request(url).responseJSON{
            response in
            //            debugPrint(respons.value as Any)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(json)
            //                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    static func getFCRestaurantPic(picAddress:String,completion:@escaping (UIImage)->Void) {
        let url = baseURL.appendingPathComponent(picAddress)
        Alamofire.request(url).responseImage{
            response in
//            debugPrint(response)
//            print(response.request!)
//            print(response.response!)
//            debugPrint(response.result)
            if let image = response.result.value {
                completion(image)
//                print("image downloaded: \(image)")
            }
        }
    }
    
    static func getFCRestaurantPic(fCRestaurantid :String,picAddress:String,completion:@escaping (UIImage)->Void) {
            let url = baseURL.appendingPathComponent(picAddress)
            Alamofire.request(url).responseImage{
                response in
                debugPrint(response)
                print(response.request!)
                print(response.response!)
                debugPrint(response.result)
                if let image = response.result.value {
                    completion(image)
//                    debugPrint("seccessful")
//                   print("image downloaded: \(image)")
                }
            }
        }

    static func getMenusOfAFCRestaurant(fCRestaurantid :String)  {
        let url = fcRestauranBasetUrl(fCRestaurantid)
     
        Alamofire.request(url).responseJSON{
            response in
 //           debugPrint(response.result)
            }
        
    }
    
}
