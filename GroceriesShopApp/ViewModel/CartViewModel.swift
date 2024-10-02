//
//  CartViewModel.swift
//  GroceriesShopApp
//
//  Created by Mac on 02/10/2024.
//

import SwiftUI

class CartViewModel: ObservableObject
{
    static var shared: CartViewModel = CartViewModel()
    
    
    @Published var showError = false
    @Published var showOrderAccept = false
    @Published var errorMessage = ""
    
    @Published var listArr: [CartItemModel] = []
    @Published var total: String = "0.0"
    
    @Published var showCheckout: Bool = false
    
    @Published var showPickerAddress: Bool = false
    @Published var showPickerPayment: Bool = false
    @Published var showPickerPromoCode: Bool = false
    
    @Published var deliveryType: Int = 1
    @Published var paymentType: Int = 1
    
    @Published var deliverPriceAmount: String = ""
    @Published var discountAmount: String = ""
    @Published var userPayAmount: String = ""
    
    

    
    

}


