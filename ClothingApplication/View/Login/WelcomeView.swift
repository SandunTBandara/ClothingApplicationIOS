//
//  WelcomeView.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-28.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("femalebuy")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                
                Image("logobrand")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                Text( "Welcome\nto our store")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Text( "all clothes in your hand")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.black.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink {
                       SignInView()
                } label: {
                    RoundButton(title: "Get Started") {
                    }
                }

               
                
                Spacer()
                    .frame(height: 80)
                
            }
            .padding(.horizontal , 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
        
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            WelcomeView()
        }
        
    }
}

