//
//  MainTabView.swift
//  GroceriesShopApp
//
//  Created by Mac on 01/10/2024.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack{
            if(homeVM.selectTab == 0) {
                HomeView()
            }else if(homeVM.selectTab == 1) {
                ExploreView()
            }else if(homeVM.selectTab == 2) {
                MyCartView()
            }else if(homeVM.selectTab == 3) {
                FavouriteView()
            }else if(homeVM.selectTab == 4) {
                AccountView()
            }
            
            VStack{
                Spacer()
                HStack{
                    TabButton(title: "Shop", icon: "store_tab", isSelect: homeVM.selectTab == 0) {
                        print("Button Tab")
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 0
                            }
                        }
                    }
                    TabButton(title: "Explore", icon: "explore_tab", isSelect: homeVM.selectTab == 1) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 1
                            }
                        }
                    }
                    TabButton(title: "Cart", icon: "cart_tab", isSelect: homeVM.selectTab == 2) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 2
                            }
                        }
                    }
                    TabButton(title: "Favourite", icon: "fav_tab", isSelect: homeVM.selectTab == 3) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 3
                            }
                        }
                    }
                    TabButton(title: "Account", icon: "account_tab", isSelect: homeVM.selectTab == 4) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 4
                            }
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, .bottomInsets)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
                
                //                    TabView(selection:$homeVM.selectTab, content: {
                //                        HomeView()
                //                            .tabItem {
                //                                Image(systemName: "house.fill")
                //                                Text("Home")
                //                            }
                //                            .tag(1)
                //                        ExploreView()
                //                            .tabItem {
                //                                Image(systemName: "cart.fill")
                //                                Text("Cart")
                //                            }
                //                            .tag(2)
                //                        FavouriteView()
                //                            .tabItem {
                //                                Image(systemName: "heart.fill")
                //                                Text("Favories")
                //                            }
                //                            .tag(3)
                //                        AccountView()
                //                            .tabItem {
                //                                Image(systemName: "person.crop.circle.fill")
                //                                Text("Profile")
                //                            }
                //                            .tag(3)
                //                    })
                //                    .preferredColorScheme(.light)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}


#Preview {
    NavigationView {
        MainTabView()
    }
}
