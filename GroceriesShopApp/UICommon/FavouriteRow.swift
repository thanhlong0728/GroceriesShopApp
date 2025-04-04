//
//  FavouriteRow.swift
//  GroceriesShopApp
//
//  Created by Mac on 08/10/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteRow: View {
    let fObj: ProductModel
    @EnvironmentObject var favVM: FavouriteViewModel
    
    var body: some View {
        NavigationLink {
            ProductDetailView(detailVM: ProductDetailViewModel(prodObj: fObj) )
        } label: {
            VStack{
                HStack(spacing: 15){
                    WebImage(url: URL(string: fObj.image ))
                        .resizable()
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    
                    VStack(spacing: 4){
                        
                        Text(fObj.name)
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(fObj.unitValue)\(fObj.unitName), price")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    Text("$\(fObj.offerPrice ?? fObj.price, specifier: "%.2f" )")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryText)
                    
                    //                Image("next")
                    //                    .resizable()
                    //                    .scaledToFit()
                    //                    .frame(width: 15, height: 15)
                    Button {
                        favVM.serviceCallAddRemoveFav(prodId: fObj.prodId)
                    } label: {
                        Image("favorite")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .foregroundColor(Color.secondaryText)
                    .padding(.trailing, 10)
                    
                }
                Divider()
            }
        }
    }
}

