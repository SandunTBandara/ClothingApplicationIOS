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

struct CartItemRow_Previews: PreviewProvider {
    static var previews: some View {
        CartItemRow(cObj: CartItemModel(dict: [
            "cart_id": 7,
            "user_id": 2,
            "prod_id": 5,
            "qty": 1,
            "cat_id": 1,
            "brand_id": 1,
            "type_id": 1,
            "name": "Organic Banana",
            "detail": "banana, fruit of the genus Musa, of the family Musaceae, one of the most important fruit crops of the world. The banana is grown in the tropics, and, though it is most widely consumed in those regions, it is valued worldwide for its flavour, nutritional value, and availability throughout the year",
            "unit_name": "pcs",
            "unit_value": "7",
            "nutrition_weight": "200g",
            "price": 2.99,
            "created_date": "2023-07-31T04:17:35.000Z",
            "modify_date": "2023-07-31T04:17:35.000Z",
            "cat_name": "Frash Fruits & Vegetable",
            "is_fav": 1,
            "brand_name": "bigs",
            "type_name": "Pulses",
            "offer_price": 2.49,
            "start_date": "2023-07-31 00:00:00",
            "end_date": "2023-08-30 00:00:00",
            "is_offer_active": 1,
            "image": "http://localhost:3001/img/product/202307310947354735xuruflIucc.png",
            "item_price": 2.49,
            "total_price": 2.49
        ]))
        .previewLayout(.sizeThatFits)
    }
}
