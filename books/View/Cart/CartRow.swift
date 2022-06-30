
import SwiftUI

struct CartRow: View {
    var item: Item
    
    var body: some View {
        // Summary
        HStack (alignment: .top, spacing: 10) {
            Image(item.item.imageName)
                .resizable()
                .frame(
                    width: 64,
                    height: 64
                )
                .cornerRadius(16)
            Spacer()
            VStack(alignment: .leading) {
                Text(item.item.title)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text("\(item.item.price, specifier: "%.2f")")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
            }
            Spacer()
            VStack(alignment: .center) {
                Text("Units")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text("\(item.units)")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
            }
            
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            alignment: .center
        )
    }
}

struct CartRow_Previews: PreviewProvider {
    static var previews: some View {
        CartRow(item: Item(id: "001", item: Book(id: 0, title: "The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 18.85, imageName: "theFellowshipOfTheKing"), units: 1))
    }
}
