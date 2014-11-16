//
//  Preferences.swift
//  BovControl
//
//  Created by Heverton Rodrigues on 16/09/14.
//  Copyright (c) 2014 Heverton Rodrigues. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

let COLOR_1 :String = "#FFFFFF"
let COLOR_2 :String = "#FFFFFF"
let COLOR_3 :String = "#FFFFFF"

private let baseURL :String = "https://"

class Preferences
{
    class func API( endPoint :String ) -> String
    {
        let action :String = endPoint.stringByReplacingOccurrencesOfString("/", withString: "", options: nil, range: nil)
        return "\(baseURL)/\(action)"
    }
    
    class var sharedInstance: Preferences
    {
        struct Static
        {
            static var instance: Preferences?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)
        {
            Static.instance = Preferences()
        }
        
        return Static.instance!
    }
}