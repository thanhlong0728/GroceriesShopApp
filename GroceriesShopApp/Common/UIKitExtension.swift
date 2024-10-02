//
//  UIKitExtension.swift
//  GroceriesShopApp
//
//  Created by Mac on 01/10/2024.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func stringDateToDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let dataFormat = DateFormatter()
        dataFormat.dateFormat = format
        return dataFormat.date(from: self)
    }
}
