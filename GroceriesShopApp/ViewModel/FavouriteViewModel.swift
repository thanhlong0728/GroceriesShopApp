//
//  FavouriteViewModel.swift
//  GroceriesShopApp
//
//  Created by Mac on 08/10/2024.
//

import SwiftUI

class FavouriteViewModel: ObservableObject
{
    static var shared: FavouriteViewModel = FavouriteViewModel()
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_FAVORITE_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
                    })
                
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
    
    func serviceCallAddRemoveFav(prodId: Int){
        ServiceCall.post(parameter: ["prod_id": prodId ], path: Globs.SV_ADD_REMOVE_FAVORITE, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    if let index = self.listArr.firstIndex(where: { $0.id == prodId }) {
                            self.listArr.remove(at: index)
                    }
                    HomeViewModel.shared.serviceCallList()
                    
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Done"
                    self.showError = true
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
    
}
