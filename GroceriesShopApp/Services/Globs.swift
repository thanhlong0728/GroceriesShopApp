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
    
    static let BASE_URL = "http://192.168.41.5:3001/api/app/"
    
    static let userPayload = "user_payload"
    static let userLogin = "user_login"
    static let SV_LOGIN =  "login"
    static let SV_SIGN_UP = "sign_up"
    static let SV_HOME =  "home"
    static let SV_PRODUCT_DETAIL = "product_detail"
    
    static let SV_ADD_REMOVE_FAVORITE = "add_remove_favorite"
    static let SV_FAVORITE_LIST = "favorite_list"
    
    static let SV_EXPLORE_LIST = "explore_category_list"
    static let SV_EXPLORE_ITEMS_LIST = "explore_category_items_list"
    
    static let SV_ADD_CART = "add_to_cart"
    static let SV_UPDATE_CART = "update_cart"
    static let SV_REMOVE_CART = "remove_cart"
    static let SV_CART_LIST = "cart_list"
    static let SV_ORDER_PLACE = "order_place"
    
    static let SV_ADD_ADDRESS = "add_delivery_address"
    static let SV_UPDATE_ADDRESS = "update_delivery_address"
    static let SV_REMOVE_ADDRESS = "delete_delivery_address"
    static let SV_ADDRESS_LIST = "delivery_address"
    
    static let SV_PROMO_CODE_LIST = "promo_code_list"
    
    static let SV_ADD_PAYMENT_METHOD = "add_payment_method"
    static let SV_REMOVE_PAYMENT_METHOD = "remove_payment_method"
    static let SV_PAYMENT_METHOD_LIST = "payment_method"
    
    static let SV_MY_ORDERS_LIST = "my_order"
    static let SV_MY_ORDERS_DETAIL = "my_order_detail"
    
    static let SV_NOTIFICATION_LIST = "notification_list"
    static let SV_NOTIFICATION_READ_ALL = "notification_read_all"
    
    static let SV_UPDATE_PROFILE = "update_profile"
    static let SV_CHANGE_PASSWORD = "change_password"
    
    static let SV_FORGOT_PASSWORD_REQUEST = "forgot_password_request"
    static let SV_FORGOT_PASSWORD_VERIFY = "forgot_password_verify"
    static let SV_FORGOT_PASSWORD_SET_PASSWORD = "forgot_password_set_password"
    
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
