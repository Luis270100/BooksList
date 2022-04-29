import Foundation


protocol BookRepository {
    func getBooks() -> [Book];
    func getBookDetail(bookId: Int) -> BookDetail;
    func getBook(bookId: Int) -> Book;
}
