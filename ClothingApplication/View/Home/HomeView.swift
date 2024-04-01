import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    @State private var showingCartView = false // State to control the cart view presentation
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Image("Thread Clothing logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text("Thread Clothing ").font(.headline).foregroundColor(.primaryText)
                }
                .padding(.top, .topInsets )
                
                Image("Thread Clothing banner")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .padding(.horizontal, 0)
                    .padding(.vertical, 20)
               
                
                SectionTitleAll(title: "Most Polpular -") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false ) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.bestArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                
                SectionTitleAll(title: "Hot News - ") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false ) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.typeArr, id: \.id) {
                            tObj in
                            
                            CategoryCell(tObj: tObj) {
                                
                            }
                        }
                    
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 8)
                
                SectionTitleAll(title: "Browse More -") {
                    
                }
                .padding(.horizontal, 20)
                ScrollView(.horizontal, showsIndicators: false ) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.listArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, .bottomInsets + 60)
                
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showingCartView.toggle() // Toggle the state to show/hide cart view
                    }) {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.primary)
                            .padding()
                    }
                    .sheet(isPresented: $showingCartView) {
                        NavigationView {
                            MyCartView()
                        }
                    }
                }
                Spacer()
            }
            .padding(.top, .topInsets + 20) // Adjust top padding to accommodate the status bar
        }
        .alert(isPresented: $homeVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(homeVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
