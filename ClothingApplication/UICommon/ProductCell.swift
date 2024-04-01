import SwiftUI
import SDWebImageSwiftUI

struct ProductCell: View {
    @State var pObj: ProductModel = ProductModel(dict: [:])
    @State var width: Double = 180.0
    var didAddCart: (() -> ())?
    
    var body: some View {
        NavigationLink {
            ProductDetailView(detailVM: ProductDetailViewModel(prodObj: pObj))
        } label: {
            VStack {
                WebImage(url: URL(string: pObj.image))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 100, height: 80)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                
                Spacer()
                
                Text(pObj.name)
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(pObj.unitValue)\(pObj.unitName), price")
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundColor(.secondaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                HStack {
                    Text("RS\(pObj.offerPrice ?? pObj.price, specifier: "%.2f")")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button(action: {
                        didAddCart?()
                    }) {
                        Image(systemName: "cart.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.primaryApp)
                            .clipShape(Circle())
                    }
                }
            }
            .padding(15)
            .frame(width: width, height: 230)
            .background(Color.blue.opacity(0.3)) // Light blue background color
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.placeholder.opacity(0.5), lineWidth: 1)
            )
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
        }
    }
}
