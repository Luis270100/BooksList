import Foundation

extension BookListView {
    class BookListViewModel : ObservableObject {
        
        let bookRepository : BookRepository;
        
        @Published var books = [Book]()
        
        public init (bookRepository: BookRepository = BookRepositoryImpl()) {
            self.bookRepository = bookRepository;
        }
        
        func getBooks() {
            books = bookRepository.getBooks();
        }
    }
}
