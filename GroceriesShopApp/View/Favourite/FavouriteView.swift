//
//  FavouriteView.swift
//  GroceriesShopApp
//
//  Created by Mac on 08/10/2024.
//

import SwiftUI

struct FavouriteView: View {
    
    @ObservedObject var favVM = FavouriteViewModel.shared
    
    var body: some View {
        ZStack{
            if(favVM.listArr.count == 0) {
                Text("Your Favorite Is Empty")
                    .font(.customfont(.bold, fontSize: 20))
            }
            ScrollView{
                LazyVStack {
                    ForEach( favVM.listArr , id: \.id, content: {
                        fObj in
                        FavouriteRow(fObj: fObj)
                    })
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
                .environmentObject(favVM)
            }
            VStack {
                HStack{
                    Spacer()
                    Text("Favorites")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                Spacer()
//                RoundButton(title: "Add All To Cart")
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, .bottomInsets + 80)
            } 
        }
        .onAppear{
//            favVM.loadFavouritesFromRealm()
            print("listArr: \(favVM.listArr)")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    FavouriteView()
}
