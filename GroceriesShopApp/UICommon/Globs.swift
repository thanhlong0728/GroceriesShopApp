//
//  Globs.swift
//  GroceriesShopApp
//
//  Created by Mac on 01/10/2024.
//

import SwiftUI

struct Globs {
    static let AppName = "Gloceries"
    
    static let NotificationTitle = "Notification"
    
    static let BASE_URL = "http://localhost:3001/api/app/"
    
    static let userPayload = "user_payload"
    static let userLogin = "user_login"
    static let SV_LOGIN = BASE_URL + "login"
    static let SV_SIGN_UP = BASE_URL + "sign_up"
    static let SV_HOME = BASE_URL + "home"
    static let SV_PRODUCT_DETAIL = BASE_URL + "product_detail"
    static let SV_ADD_REMOVE_FAVORITE = BASE_URL + "add_remove_favorite"
    static let SV_FAVORITE_LIST = BASE_URL + "favorite_list"
    static let SV_EXPLORE_LIST = BASE_URL + "explore_category_list"
    static let SV_EXPLORE_ITEMS_LIST = BASE_URL + "explore_category_items_list"
    static let SV_ADD_CART = BASE_URL + "add_to_cart"
    static let SV_UPDATE_CART = BASE_URL + "update_cart"
    static let SV_REMOVE_CART = BASE_URL + "remove_cart"
    static let SV_CART_LIST = BASE_URL + "cart_list"
    static let SV_ORDER_PLACE = BASE_URL + "order_place"
}

struct KKey {
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
}

class Utils {
    class func UDSET(data: Any, key: String) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func UDValue( key: String) -> Any {
       return UserDefaults.standard.value(forKey: key) as Any
    }
    
    class func UDValueBool( key: String) -> Bool {
       return UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
    
    class func UDValueTrueBool( key: String) -> Bool {
       return UserDefaults.standard.value(forKey: key) as? Bool ?? true
    }
    
    class func UDRemove( key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
