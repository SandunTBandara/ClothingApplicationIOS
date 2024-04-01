//
//  OrderItemRow.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-25.
//

import SwiftUI
import SDWebImageSwiftUI

struct OrderItemRow: View {
    @State var pObj: OrderItemModel = OrderItemModel(dict: [:])
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 15) {
                WebImage(url: URL(string: pObj.image))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(pObj.name)
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                    
                    Text("\(pObj.unitValue)\(pObj.unitName), Price")
                        .font(.customfont(.medium, fontSize: 12))
                        .foregroundColor(.secondaryText)
                        .lineLimit(1)
                    
                    HStack {
                        Text("QTY:")
                            .font(.customfont(.bold, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("\(pObj.qty)")
                            .font(.customfont(.bold, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("×")
                            .font(.customfont(.bold, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("RS \(pObj.itemPrice, specifier: "%.2f")")
                            .font(.customfont(.bold, fontSize: 14))
                            .foregroundColor(.primaryText)
                    }
                }
                
                Spacer()
                
                Text("RS \(pObj.offerPrice ?? pObj.price, specifier: "%.2f")")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
            }
            .padding(12)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 2)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}


struct OrderItemRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemRow()
    }
}
