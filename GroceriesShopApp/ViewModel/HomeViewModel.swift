//
//  HomeViewModel.swift
//  GroceriesShopApp
//
//  Created by Mac on 01/10/2024.
//

import SwiftUI

class HomeViewModel: ObservableObject
{
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectTab: Int = 0
    @Published var txtSearch: String = ""
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var offerArr: [ProductModel] = []
    @Published var bestArr: [ProductModel] = []
    @Published var listArr: [ProductModel] = []
    @Published var typeArr: [TypeModel] = []
    
    init() {
        serviceCallList()
    }
    
    //MARK: ServiceCall
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_HOME, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        print("payloadObj::: \(payloadObj)")
                        self.offerArr = (payloadObj.value(forKey: "offer_list") as? NSArray ?? []).map({ obj in
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        self.bestArr = (payloadObj.value(forKey: "best_sell_list") as? NSArray ?? []).map({ obj in
                            
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        self.listArr = (payloadObj.value(forKey: "list") as? NSArray ?? []).map({ obj in
                            
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        self.typeArr = (payloadObj.value(forKey: "type_list") as? NSArray ?? []).map({ obj in
                            
                            return TypeModel(dict: obj as? NSDictionary ?? [:])
                        })
                    }
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    func updateFavouriteStatus(productId: Int, isFavourite: Bool) {
            if let index = listArr.firstIndex(where: { $0.prodId == productId }) {
                listArr[index].isFav = isFavourite
            }
        }
    
}


