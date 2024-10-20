//
//  NotificationView.swift
//  GroceriesShopApp
//
//  Created by Mac on 20/10/2024.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack(spacing: 15) {
         
                        VStack{
                            HStack {
                                Text("Title")
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                
                                Text("")
                                    .font(.customfont(.regular, fontSize: 12))
                                    .foregroundColor(.secondaryText)
                                
                            }
                                Text("Message")
                                    .font(.customfont(.medium, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .multilineTextAlignment( .leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                            }
                         
                        .padding(15)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)

                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)

            }
            
            
            VStack {
                    
                HStack{
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    
                   
                    Spacer()
                    
                    Text("Notification")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    
                    Button {
                        
                      
                    } label: {
                        Text("Read All")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryApp)
                    }
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
        }
    
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NotificationView()
}
