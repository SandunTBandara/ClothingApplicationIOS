//
//  ExploreView.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-29.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var explorVM = ExploreViewModel.shared
    @State var txtSearch: String = ""
    
    var columns = [
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        VStack {
            Text("Explore Our Collection")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 50)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(explorVM.listArr, id: \.id) { cObj in
                        NavigationLink(destination: ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: cObj))) {
                            ExploreCategoryCell(cObj: cObj)
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 300) // Adjust the height as needed
                                .cornerRadius(12)
                                .shadow(radius: 4)
                        }
                    }
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 20)
            }
        }
        .padding(.horizontal, 2)
        .navigationBarTitle("Explore", displayMode: .inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExploreView()
        }
    }
}

