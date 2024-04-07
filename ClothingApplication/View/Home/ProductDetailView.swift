//
//  ProductDetailView.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-29.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM: ProductDetailViewModel = ProductDetailViewModel(prodObj: ProductModel(dict: [:]) )
    
    var body: some View {
        ZStack{
            
            ScrollView {
                ZStack(alignment: .bottom) {
                    GeometryReader { geometry in
                        Rectangle()
                            .foregroundColor(Color(hex: "#96DED1"))
                            .cornerRadius(20)
                            .frame(width: geometry.size.width, height: geometry.size.width * 0.8)
                            .overlay(
                                WebImage(url: URL(string: detailVM.pObj.image))
                                    .resizable()
                                    .indicator(.activity)
                                    .transition(.fade(duration: 0.5))
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8)
                            )
                    }
                    .frame(height: .screenWidth * 0.8)
                }


                
                VStack{
                    HStack{
                        Text(detailVM.pObj.name)
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            detailVM.serviceCallAddRemoveFav()
                        } label: {
                            
                            Image( detailVM.isFav ? "favorite" : "fav"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .foregroundColor(Color.secondaryText)

                    }
                    Text("\(detailVM.pObj.unitValue)\(detailVM.pObj.unitName), Price")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            detailVM.addSubQTY(isAdd: false)
                        }) {
                            Image(systemName: "minus.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        Text("\(detailVM.qty)")
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .frame(width: 45, height: 45)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.placeholder.opacity(0.5), lineWidth: 1)
                            )
                        
                        Button(action: {
                            detailVM.addSubQTY(isAdd: true)
                        }) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        Spacer()
                        
                        Text("RS\( (detailVM.pObj.offerPrice ?? detailVM.pObj.price) * Double(detailVM.qty), specifier: "%.2f")")
                            .font(.customfont(.bold, fontSize: 15))
                            .foregroundColor(.primaryText)
                    }
                    .padding(.vertical, 8)

                    
                    Divider()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                VStack{
                    HStack{
                        Text("Product Detail")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            withAnimation {
                                detailVM.showDetail()
                            }
                            
                        } label: {
                            
                            Image(systemName: detailVM.isShowDetail ? "chevron.down" : "chevron.right")
                                .foregroundColor(.primaryText)
                                .font(Font.system(size: 15))
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)

                    }
                    
                    if(detailVM.isShowDetail) {
                        Text(detailVM.pObj.detail)
                            .font(.customfont(.medium, fontSize: 13))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom , 8)
                    }
                    
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                
                
                RoundButton(title: "Add To Basket") {
                    CartViewModel.serviceCallAddToCart(prodId: detailVM.pObj.prodId, qty: detailVM.qty) { isDone, msg  in
                        
                        detailVM.qty = 1
                        
                        self.detailVM.errorMessage = msg
                        self.detailVM.showError = true
                    }
                }
                .padding( 20)
                
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
                    
                    Button {
                    } label: {
                        Image("share")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }

                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $detailVM.showError, content: {
            
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage)  , dismissButton: .default(Text("Ok"))  )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

