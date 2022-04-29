import Foundation


class BookRepositoryImpl : BookRepository {
    
    func getBooks() -> [Book] {
        return books;
    }
    
    func getBook(bookId: Int) -> BookDetail {
        if let bookIndex = booksDetail.firstIndex(where: {$0.bookId == bookId}) {
            return booksDetail[bookIndex];
        }
        return BookDetail(id: "", bookId: 0, author: "", title: "", price: 0.0, genre: [], kind: "", description: "", imageName: "", isAvailable: false);
    }
}
