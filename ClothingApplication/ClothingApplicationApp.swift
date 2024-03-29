//
//  ClothingApplicationApp.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-28.
//

import SwiftUI

@main
struct ClothingApplicationApp: App {
    
    @StateObject var mainVM = MainViewModel.shared
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            WelcomeView()
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
