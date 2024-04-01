import SwiftUI

struct SectionTitleAll: View {
    @State var title: String = "Title"
    var didTap: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.blue) // Update with your preferred color
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(height: 40)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
        .onTapGesture {
            didTap?()
        }
    }
}

struct SectionTitleAll_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleAll()
    }
}
