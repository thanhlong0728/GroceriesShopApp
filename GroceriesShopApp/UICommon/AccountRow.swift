//
//  AccountRow.swift
//  GroceriesShopApp
//
//  Created by Mac on 14/10/2024.
//

import SwiftUI

struct AccountRow: View {
    @State var title: String = "Title"
    @State var icon: String = "a_order"
    
    var body: some View {
        VStack{
            HStack(spacing:15){
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25,height: 25)
                Text(title)
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                Image("next")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15,height: 15)
                    .colorMultiply(.black)
            }
            .padding(20)
            Divider()
        }
    }
}


