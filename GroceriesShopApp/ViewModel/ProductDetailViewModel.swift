//
//  ProductDetailViewModel.swift
//  GroceriesShopApp
//
//  Created by Mac on 02/10/2024.
//

import SwiftUI

class ProductDetailViewModel: ObservableObject {
    @Published var pObj: ProductModel
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var nutritionArr: [NutritionModel] = []
    @Published var imageArr: [ImageModel] = []
    @Published var isFav: Bool = false
    @Published var isShowDetail: Bool = true
    @Published var isShowNutrition: Bool = false
    @Published var qty: Int = 1

    init(prodObj: ProductModel) {
        self.pObj = prodObj
        self.isFav = FavouriteViewModel.shared.isProductFavourite(productId: prodObj.prodId)
        serviceCallDetail()
    }

    func showDetail(){
        isShowDetail = !isShowDetail
    }

    func showNutrition(){
        isShowNutrition = !isShowNutrition
    }

    func addSubQTY(isAdd: Bool = true) {
        if(isAdd) {
            qty += 1
            if(qty > 99) {
                qty = 99
            }
        }else{
            qty -= 1
            if(qty < 1) {
                qty = 1
            }
        }
    }

    // MARK: ServiceCall
    func serviceCallDetail(){
        ServiceCall.post(parameter: ["prod_id": self.pObj.prodId ?? "6" ], path: Globs.SV_PRODUCT_DETAIL, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        self.pObj = ProductModel(dict: payloadObj)
                        self.nutritionArr = (payloadObj.value(forKey: "nutrition_list") as? NSArray ?? []).map({ obj in
                            return NutritionModel(dict: obj as? NSDictionary ?? [:])
                        })
                        self.imageArr = (payloadObj.value(forKey: "images") as? NSArray ?? []).map({ obj in
                            return ImageModel(dict: obj as? NSDictionary ?? [:])
                        })
                        self.isFav = FavouriteViewModel.shared.isProductFavourite(productId: self.pObj.prodId)
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

    func serviceCallAddRemoveFav(){
        if isFav {
            FavouriteViewModel.shared.removeFromFavourites(productId: self.pObj.prodId)
        } else {
            FavouriteViewModel.shared.addToFavourites(product: self.pObj)
        }
        self.isFav.toggle()

//        ServiceCall.post(parameter: ["prod_id": self.pObj.prodId ], path: Globs.SV_ADD_REMOVE_FAVORITE, isToken: true ) { responseObj in
//            if let response = responseObj as? NSDictionary {
//                if response.value(forKey: KKey.status) as? String ?? "" != "1" {
//                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? ""
//                    self.showError = true
//                    self.isFav = FavouriteViewModel.shared.isProductFavourite(productId: self.pObj.prodId)
//                } else {
//                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Done"
//                    self.showError = true
//                }
//            }
//        } failure: { error in
//            self.errorMessage = error?.localizedDescription ?? ""
//            self.showError = true
//            self.isFav = FavouriteViewModel.shared.isProductFavourite(productId: self.pObj.prodId)
//        }
    }
}
