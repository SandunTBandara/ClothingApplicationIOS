//
//  ExploreCategoryCell.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-29.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExploreCategoryCell: View {
    @State var cObj: ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: cObj.image ))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 120, height: 90)
            
            Spacer()
            
            Text(cObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }
        .padding(15)
        .background(Color.gray.opacity(0.3)) // Change background color to blue
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.blue, lineWidth: 1) // Stroke color also changed to blue
        )
    }
}

struct ExploreCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        ExploreCategoryCell(cObj: ExploreCategoryModel(dict: [ "cat_id": 1,
                                                               "cat_name": "Pulses",
                                                               "image": "http://192.168.1.3:3001/img/type/202307261610181018aVOpgmY1W1.png",
                                                               "color": "F8A44C"]) )
        .padding(20)
    }
}

