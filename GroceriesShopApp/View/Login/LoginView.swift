//
//  LoginView.swift
//  GroceriesShopApp
//
//  Created by Mac on 26/09/2024.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared
    
    var body: some View {
        ZStack{
            Image("bottom_bg")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Image("color_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width:40, height: 40)
                    .padding(.bottom,.screenWidth * 0.1)
                Text("Loging")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment:.leading)
                    .padding(.bottom,4)
                Text("Enter your emails and password")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondary)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment:.leading)
                    .padding(.bottom,.screenWidth * 0.1)
                LineTextField(title: "Email", placeholder: "Enter your email address",txt: $loginVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom,.screenWidth * 0.07)
                LineSecureField( title: "Password", placeholder: "Enter your email password",txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                    .padding(.bottom,.screenWidth * 0.02)
                Button{
                    
                }label: {
                    Text("Forgot Password?")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primary)
                }
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment:.trailing)
                .padding(.bottom,.screenWidth * 0.02)
                RoundButton(title: "Log In"){
                    loginVM.serviceCallLogin()
                }
                .padding(.bottom,.screenWidth * 0.05)
                HStack{
                    Text("Don't have an account")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primaryText)
                    Text("Signup")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primaryApp)
                }
                Spacer()
            }
            .padding(.top,.topInsets + 64)
            .padding(.horizontal,20)
            .padding(.bottom,.bottomInsets)
            VStack{
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image("back")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top,.topInsets)
            .padding(.horizontal,20)
            
        }
        .alert( isPresented: $loginVM.showError){
            Alert(title: Text(Globs.NotificationTitle), message: Text(loginVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
