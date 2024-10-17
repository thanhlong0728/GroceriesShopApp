//
//  GroceriesShopAppApp.swift
//  GroceriesShopApp
//
//  Created by Mac on 26/09/2024.
//

import SwiftUI

@main
struct GroceriesShopAppApp: App {
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if mainVM.isUserLogin {
                    MainTabView()
                }else{
                    WelcomeView()
                }
            }
        }
    }
}


