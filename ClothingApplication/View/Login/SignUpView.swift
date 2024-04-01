//
//  SignUpView.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-29.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView {
                VStack{
                    

                    Spacer();
                    Spacer();
                    
                    Text("Sign Up")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 50)
                    
                    
                    
                    LineTextField( title: "Username", placholder: "Enter your username", txt: $mainVM.txtUsername)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineTextField( title: "Email", placholder: "Enter your email address", txt: $mainVM.txtEmail, keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineSecureField( title: "Password", placholder: "Enter your password", txt: $mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                        .padding(.bottom, .screenWidth * 0.04).padding(.bottom, 20)
        
                    
                    
                    RoundButton(title: "Sing Up") {
                        mainVM.serviceCallSignUp()
                    }
                    .padding(.bottom, .screenWidth * 0.05)
                    
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        HStack{
                            Text("Alredy have an account?")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryText)
                            
                            Text("Sign In")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryApp)
                        }
                    }

                   
                    
                    Spacer()
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
            }
            
            
            VStack {
                
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()

                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $mainVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(mainVM.errorMessage) , dismissButton: .default(Text("Ok")))
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

