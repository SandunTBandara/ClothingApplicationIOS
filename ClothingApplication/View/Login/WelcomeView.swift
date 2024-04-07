//
//  WelcomeView.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("Thread Clothing")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                
                NavigationLink {
                       SignInView()
                } label: {
                    RoundButton(title: "Get Started") {
                    }
                }

               
                
                Spacer()
                    .frame(height: 120)
                
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

