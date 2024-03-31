//
//  SignInView.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-28.
//

import SwiftUI

struct SignInView: View {
    
    @State var txtMobile: String = ""

    
    
    var body: some View {
        ZStack{
            
            Image("clotheimg1")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Image("clotheimg1")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenWidth)
                
                Spacer()
            }
            
            ScrollView{
                    
                VStack(alignment: .leading){
                    Text( "Lets buy your favourite clothes")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom , 170)
                    
                   
                    
                    NavigationLink {
                       LoginView()
                    } label: {
                        Text("Sign In")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    .background( Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    
                    NavigationLink {
                      SignUpView()
                    } label: {
                        Text("Sign Up")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    .background( Color.primaryApp)
                    .cornerRadius(20)
                    .padding(.bottom, 8 )

                    
                    Divider()
                        .padding(.bottom, 25)
                
                    Text( "Or connect with social media")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom , 25)
                
                    
                }
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets +  .screenWidth * 0.6  )
                
            }
            
                
        }
        
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
