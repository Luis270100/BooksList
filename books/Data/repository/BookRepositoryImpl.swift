import Foundation


class BookRepositoryImpl : BookRepository {
    
    func getBooks() -> [Book] {
        return books;
    }
    
    func getBookDetail(bookId: Int) -> BookDetail {
        if let bookIndex = booksDetail.firstIndex(where: {$0.bookId == bookId}) {
            return booksDetail[bookIndex];
        }
        return BookDetail(id: "", bookId: 0, author: "", title: "", price: 0.0, genre: [], kind: "", description: "", imageName: "", isAvailable: false);
    }
    
    func getBook(bookId: Int) -> Book {
        if let bookIndex = books.firstIndex(where: {$0.id == bookId}) {
            return books[bookIndex];
        }
        return Book(id: 00, title: "", author: "", price: 0.0, imageName: "");
    }
}
