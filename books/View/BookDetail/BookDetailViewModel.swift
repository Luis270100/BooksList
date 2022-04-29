import Foundation


extension BookDetailView {
    class BookDetailViewModel : ObservableObject {
        
        @Published var bookDetail : BookDetail?
        @Published var bookImage = "";
        @Published var bookTitle = "";
        @Published var bookAuthor = "";
        @Published var bookDescription = "";
        @Published var bookPrice = 0.0;
        @Published var bookGenres = [String]();
        
        var cartRepository : CartRepository;
        var bookRepository : BookRepository;
        
        init(cartRepository: CartRepository = _CartRepositoryImplSingleton, bookRepository: BookRepository = BookRepositoryImpl()) {
            self.cartRepository = cartRepository;
            self.bookRepository = bookRepository;
        }
        
        
        func getBookDetail(bookId: Int) {
            bookDetail = bookRepository.getBook(bookId: bookId);
            bookImage = bookDetail?.imageName ?? "";
            bookTitle = bookDetail?.title ?? "";
            bookAuthor = bookDetail?.author ?? "";
            bookDescription = bookDetail?.description ?? "";
            bookPrice = bookDetail?.price ?? 0.0;
        }
        
        func parseGenre() {
            bookDetail?.genre.forEach { genre in
                switch genre {
                case .economics :
                    bookGenres.append("Economics")
                case .fantasy:
                    bookGenres.append("Fantasy")
                case .action:
                    bookGenres.append("Action")
                case .history:
                    bookGenres.append("History")
                case .present:
                    bookGenres.append("Present")
                case .drama:
                    bookGenres.append("Drama")
                case .scienceFiction:
                    bookGenres.append("Science Fiction")
                case .business:
                    bookGenres.append("Business")
                }
            }
        }
        
        func emptyListOfGenres() {
            bookGenres.removeAll();
        }
    }
}
