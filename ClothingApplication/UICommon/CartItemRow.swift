import SwiftUI
import SDWebImageSwiftUI

struct CartItemRow: View {
    @State var cObj: CartItemModel
    
    var body: some View {
        HStack(spacing: 15) {
            WebImage(url: URL(string: cObj.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(cObj.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("\(cObj.unitValue) \(cObj.unitName)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 10) {
                    Button(action: {
                        CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty - 1)
                    }) {
                        Image(systemName: "minus.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.accentColor)
                    }
                    
                    Text("\(cObj.qty)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .frame(width: 45, height: 45)
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.accentColor, lineWidth: 1))
                    
                    Button(action: {
                        CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty + 1)
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.accentColor)
                    }
                }
                
                HStack(spacing: 10) {
                    Spacer()
                    
                    Text("RS\(cObj.offerPrice ?? cObj.price, specifier: "%.2f")")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.trailing, 20)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color(.systemGray).opacity(0.4), radius: 4, x: 0, y: 2)
        .padding(.vertical, 8)
        .overlay(
            Button(action: {
                CartViewModel.shared.serviceCallRemove(cObj: cObj)
            }) {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.red)
            }
            .padding(.trailing, 20)
            .frame(maxWidth: .infinity, alignment: .trailing),
            alignment: .trailing
        )
    }
}
