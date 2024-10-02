//
//  MainTabView.swift
//  GroceriesShopApp
//
//  Created by Mac on 01/10/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack{
            HStack{
                Button{
                    MainViewModel.shared.isUserLogin = false
                }label: {
                    Text("Logout")
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
