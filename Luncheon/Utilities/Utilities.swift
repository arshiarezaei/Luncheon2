//
//  Utilities.swift
//  Luncheon
//
//  Created by arshiya  on 7/24/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation


class Utilities {
    private static let numbers = ["0":"۰","1":"۱","2":"۲","3":"۳","4":"۴","5":"۵","6":"۶","7":"۷","8":"۸","9":"۹"]
    static func convertToPersianNumber(number:Double) -> String {
        var result:String = String(number)
        for (key,value) in Utilities.numbers  {
            result = result.replacingOccurrences(of: key, with: value)
        }
        return result
    }
    static func convertToPersianNumber(number:Int) -> String {
           var result:String = String(number)
           for (key,value) in Utilities.numbers  {
               result = result.replacingOccurrences(of: key, with: value)
           }
           return result
       }
}
