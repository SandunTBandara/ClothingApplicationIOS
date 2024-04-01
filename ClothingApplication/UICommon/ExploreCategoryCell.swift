import SwiftUI
import SDWebImageSwiftUI

struct ExploreCategoryCell: View {
    @State var cObj: ExploreCategoryModel = ExploreCategoryModel(dict: [:])
   
    var body: some View {
        VStack(spacing: 8) {
            WebImage(url: URL(string: cObj.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 200, height: 140)
                .cornerRadius(16)
            
            Text(cObj.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct ExploreCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        ExploreCategoryCell(cObj: ExploreCategoryModel(dict: [
            "cat_id": 1,
            "cat_name": "Pulses",
            "image": "http://192.168.1.3:3001/img/type/202307261610181018aVOpgmY1W1.png",
            "color": "F8A44C"
        ]))
        .padding(20)
    }
}
