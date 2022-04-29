
import SwiftUI

struct BookRow: View {
    
    let cartRepository : CartRepository = _CartRepositoryImplSingleton;
    var bookRepository : BookRepository;
    var book: Book;
    
    init(book:Book, bookRepository : BookRepository = BookRepositoryImpl()) {
        self.book = book;
        self.bookRepository = bookRepository;
    }
    
    var body: some View {
        NavigationLink(destination: BookDetailView(bookId: book.id)) {
            HStack (alignment: .top , spacing: 24) {
                Image(book.imageName)
                    .resizable()
                    .frame(width: 70, height: 120)
                    .cornerRadius(10)
                VStack (alignment: .leading, spacing: 8) {
                    Text(book.title).font(.system(size: 16)).bold().foregroundColor(.black)
                    Text("By: \(book.author)").font(.system(size: 14)).foregroundColor(.gray)
                        .padding(.bottom)
                    Text("\(book.price, specifier: "%.2f")").font(.system(size: 20)).bold().foregroundColor(.black)
                }
                
            }
            .padding(16)
        }
    }
}
