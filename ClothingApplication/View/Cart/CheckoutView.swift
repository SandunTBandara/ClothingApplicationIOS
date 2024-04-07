//
//  CheckoutView.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-24.
//

import SwiftUI

struct CheckoutView: View {
    
    @Binding var isShow: Bool
    @StateObject var cartVM = CartViewModel.shared
    
    
    
    var body: some View {
        VStack {
            
            Spacer()
            VStack{
                HStack{
                    
                    Text("Checkout")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    Button {
                        $isShow.wrappedValue = false
                    } label: {
                        Image("close")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    
                }
                .padding(.top, 30)
                
                
                
                
                VStack{
                    HStack {
                        
                        Picker("",  selection: $cartVM.deliveryType) {
                            Text("Gome Delivery").tag(1)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 180)
                    }.hidden()
                    HStack {
                        Text("Delivery Type")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.secondaryText)
                            .frame(height: 46)
                        
                        Spacer()
                        
                        Text("Home Delivery")
                            .font(.customfont(.semibold, fontSize: 15))
                            .foregroundColor(.primaryText)
                            .frame(height: 46)
                    }
                    
                    Divider()
                    
                    if(cartVM.deliveryType == 1) {
                        
                        NavigationLink {
                            DelieryAddressView(isPicker: true, didSelect: {
                                aObj in
                                cartVM.deliverObj = aObj
                            } )
                        } label: {
                            HStack {
                                Text("Delivery Address")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.secondaryText)
                                    .frame(height: 46)
                                
                                Spacer()
                                
                                Text( cartVM.deliverObj?.name ?? "Select Address")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    .frame(height: 46)
                                
                                Image("next")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.primaryText)
                                
                            }
                        }

                        
                        
                        Divider()
                    }
                    
                    
                    HStack {
                        Text("Payment Type")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.secondaryText)
                            .frame(height: 46)
                        
                        Spacer()
                        
                        Picker("",  selection: $cartVM.paymentType) {
                            Text("COD").tag(1)
                            Text("Online").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 150)
                    }
                    
                    Divider()
                    if(cartVM.paymentType == 2) {
                        
                        NavigationLink {
                            PaymentMethodsView(isPicker: true, didSelect: {
                                pObj in
                                cartVM.paymentObj = pObj
                            } )
                        } label: {
                            HStack {
                                Text("Payment")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.secondaryText)
                                    .frame(height: 46)
                                
                                Spacer()
                                
                                Image("master")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 20)
                                
                                Text( cartVM.paymentObj?.cardNumber ?? "Select")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    .frame(height: 46)
                                
                                Image("next")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.primaryText)
                                
                            }
                        }
                        
                        Divider()
                    }
                    

                }
                
                VStack{
                    HStack {
                        Text("Totat")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        
                        Spacer()
                        
                        Text("RS \(cartVM.total)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                    }
                    
                    HStack {
                        Text("Delivery Cost")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        
                        Spacer()
                        
                        Text("+ RS \(cartVM.deliverPriceAmount)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                    }
                    
                    HStack {
                        Text("Save")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        
                        Spacer()
                        
                        Text("- RS \(cartVM.discountAmount)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.red)
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                HStack {
                    Text("     Final Total")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    Spacer()
                    
                    
                    
                    Text("RS\(cartVM.userPayAmount)")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(height: 46)
                    
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primaryText)
                    
                }
                Divider()
                
                
                RoundButton(title: "Place Order") {
                    cartVM.serviceCallOrderPlace()
                }
                .padding(.bottom, .bottomInsets + 70)
            }
            .padding(.horizontal, 20)
            .background(Color.white)
            .cornerRadius(20, corner: [.topLeft, .topRight])
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    @State static var isShow: Bool = false;
    static var previews: some View {
        NavigationView {
            CheckoutView(isShow: $isShow)
        }
        
    }
}

