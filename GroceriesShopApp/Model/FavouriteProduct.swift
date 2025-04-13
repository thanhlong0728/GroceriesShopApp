//
//  File.swift
//  GroceriesShopApp
//
//  Created by Mac on 13/04/2025.
//

import RealmSwift

class FavouriteProduct: Object {
    @Persisted(primaryKey: true) var productId: Int = 0
    @Persisted var name: String = ""
    @Persisted var image: String = ""
    @Persisted var unitName: String = ""
    @Persisted var unitValue: String = ""
    @Persisted var price: Double = 0.0
}
