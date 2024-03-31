//
//  AccountView.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-04-01.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack{
            VStack{
                
                HStack(spacing: 15) {
                    Text("Acccount Details").bold().foregroundColor(.blue).padding(.bottom, 30)
                        .padding(.top, 20)
                        .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
                Divider()
                Spacer()
                
                ScrollView {
                    LazyVStack {
                        
                        VStack{
                            
                            NavigationLink {
                                MyOrdersView()
                            } label: {
                                AccountRow(title: "My Orders", icon: "bag")
                            }
                            
                            
                            
                            
                            NavigationLink {
                                DelieryAddressView()
                            } label: {
                                AccountRow(title: "Delivery Address", icon: "a_delivery_address")
                            }
                            
                            
                            NavigationLink {
                                PaymentMethodsView()
                            } label: {
                                AccountRow(title: "Payment Methods", icon: "credit-card")
                            }
                            
                            
                        }
                        
                    
                        
                        Button {
                            MainViewModel.shared.logout()
                        } label: {
                            ZStack {
                                Text("Log Out")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryApp)
                                    .multilineTextAlignment(.center)
                                
                                HStack{
                                    Spacer()
                                    Image("logout")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .padding(.trailing, 20)
                                }
                            }
                           
                        }
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        .background( Color(hex: "F2F3F2"))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        
                    }
                    
                }
            }
            .padding(.bottom, .bottomInsets + 60)
        }
        .ignoresSafeArea()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            AccountView()
        }
        
    }
}
