//
//  SignInView.swift
//  GroceriesShopApp
//
//  Created by Mac on 26/09/2024.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    @State var txtMobile : String = ""
    @State var isShowPicker: Bool = false
    @State var countryObj : Country?
    
    var body: some View {
        ZStack{
            Image("bottom_bg")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
            VStack{
               Image("sign_in_top")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenWidth)
                        
                Spacer()
            }
            ScrollView{
                VStack(alignment:.leading){
                    Text("Get your groceries\nwith nectar")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,25)
                    HStack{
                        Button{
                            isShowPicker = true
                            
                        }label: {
//                            Image("")
                            if let countryObj = countryObj{
                                Text("\( countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 35))
                                    .foregroundColor(.primaryText)
                                Text("+\( countryObj.phoneCode )")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                            }
                        }
                        TextField("Enter Mobile", text: $txtMobile)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                        
                    }
                    NavigationLink{
                        LoginView()
                    }label: {
                        Text("Continue with Email Sign In")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight:60, maxHeight:60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom,8)
                    NavigationLink{
                        SignupView()
                    }label: {
                        Text("Continue with Email Sign Up")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight:60, maxHeight:60)
                    .background(Color.primaryApp)
                    .cornerRadius(20)
                    .padding(.bottom,8)
                    Divider()
                        .padding(.bottom,25)
                    Text("Or connect with social media")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment:.center)
                        .padding(.bottom,25)
                    Button{
                        
                    } label: {
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Continue with Google")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight:60, maxHeight:60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom,8)
                    Button{
                        
                    } label: {
                        Image("fb_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Continue with Facebook")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight:60, maxHeight:60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                }
                .padding(.horizontal,20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth )
            }
            
        }
        .onAppear{
            self.countryObj = Country(phoneCode: "84", isoCode: "VN")
        }
        .sheet(isPresented: $isShowPicker, content: {
            CountryPickerUI(country: $countryObj)
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
