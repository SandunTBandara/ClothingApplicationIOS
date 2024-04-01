import SwiftUI

struct TabButton: View {
    
    var title: String
    var isSelect: Bool
    var didSelect: (()->())
    
    var body: some View {
        Button(action: {
            didSelect()
        }, label: {
            VStack(spacing: 6) {
             
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(isSelect ? .blue : .black)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: .gray, radius: 3, x: 0, y: 0)
            )
        })
    }
}
