//
//  FavouriteViewModel.swift
//  GroceriesShopApp
//
//  Created by Mac on 08/10/2024.
//

import SwiftUI
import RealmSwift

class FavouriteViewModel: ObservableObject {
    static var shared: FavouriteViewModel = FavouriteViewModel()
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var listArr: [ProductModel] = []

    private var realm: Realm?
    
    private init() {
        do {
            realm = try Realm()
        } catch {
            print("Error initializing Realm: \(error)")
            errorMessage = "Không thể khởi tạo cơ sở dữ liệu."
            showError = true
        }
        loadFavouritesFromRealm()
    }

    // MARK: Realm Operations
     func loadFavouritesFromRealm() {
        guard let realm = realm else {return}
        let favouriteProducts = realm.objects(FavouriteProduct.self)
        self.listArr = favouriteProducts.map { favProduct in
            let dict: [String: Any] = [
                "prod_id": favProduct.productId,
                "name": favProduct.name,
                "image": favProduct.image,
                "is_fav": 1 ,
                "unit_name": favProduct.unitName,
                "unit_value": favProduct.unitValue,
                "price": favProduct.price
            ]
            return ProductModel(dict: dict as NSDictionary)
        }
    }

    func addToFavourites(product: ProductModel) {
        guard let realm = realm else { return }
        do {
            try realm.write {
                let favouriteProduct = FavouriteProduct()
                favouriteProduct.productId = product.prodId
                favouriteProduct.name = product.name
                favouriteProduct.image = product.image
                favouriteProduct.unitName = product.unitName
                favouriteProduct.unitValue = product.unitValue
                favouriteProduct.price = product.price
                
                print("favouriteProduct:: \(favouriteProduct)")

                realm.add(favouriteProduct, update: .modified)
            }
            loadFavouritesFromRealm()
            HomeViewModel.shared.updateFavouriteStatus(productId: product.prodId, isFavourite: true)
        } catch {
            errorMessage = "Lỗi khi thêm vào yêu thích: \(error)"
            showError = true
        }
    }

    func removeFromFavourites(productId: Int) {
        guard let realm = realm else { return }
        do {
            try realm.write {
                if let favouriteProductToDelete = realm.object(ofType: FavouriteProduct.self, forPrimaryKey: productId) {
                    realm.delete(favouriteProductToDelete)
                }
            }
            loadFavouritesFromRealm()
            HomeViewModel.shared.updateFavouriteStatus(productId: productId, isFavourite: false)
        } catch {
            errorMessage = "Lỗi khi xóa khỏi yêu thích: \(error)"
            showError = true
        }
    }

    func isProductFavourite(productId: Int) -> Bool {
        guard let realm = realm else { return false }
        return realm.object(ofType: FavouriteProduct.self, forPrimaryKey: productId) != nil
    }

    // MARK: ServiceCall
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_FAVORITE_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    let serverFavourites = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
                    })

                    guard let realm = self.realm else { return }
                    do {
                        try realm.write {
                            for serverFav in serverFavourites {
                                let favouriteProduct = FavouriteProduct()
                                favouriteProduct.productId = serverFav.prodId
                                favouriteProduct.name = serverFav.name
                                favouriteProduct.image = serverFav.image
                                realm.add(favouriteProduct, update: .modified)
                            }
                        }
                        self.loadFavouritesFromRealm()
                    } catch {
                        print("Error syncing favourites with server: \(error)")
                        self.errorMessage = "Lỗi đồng bộ yêu thích."
                        self.showError = true
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

    func serviceCallAddRemoveFav(prodId: Int){
        ServiceCall.post(parameter: ["prod_id": prodId ], path: Globs.SV_ADD_REMOVE_FAVORITE, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    if self.isProductFavourite(productId: prodId) {
                        self.removeFromFavourites(productId: prodId)
                    } else {
                        print("Cần ProductModel đầy đủ để thêm vào Realm.")
                    }
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
