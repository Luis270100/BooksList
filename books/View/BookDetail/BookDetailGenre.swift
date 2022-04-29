
import SwiftUI

struct BookDetailGenre: View {
    var genre : String;
    
    init(genre : String ) {
        self.genre = genre;
    }
    
    var body: some View {
        Text(genre)
            .padding(8)
            .foregroundColor(.black)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}
