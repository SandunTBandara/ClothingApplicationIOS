//
//  SectionTitleAll.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-29.
//

import SwiftUI

struct SectionTitleAll: View {
    @State var title: String = " Title"
    var didTap : (()->())?
    
    var body: some View {
        
        HStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundColor(.Turquis)
                 Spacer()
            
        }
        .frame(height: 40)
    }
}

struct SectionTitleAll_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleAll()
            .padding(20)
    }
}
