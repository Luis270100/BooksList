import Foundation


protocol BookRepository {
    func getBooks() -> [Book];
    func getBook(bookId: Int) -> BookDetail;
}
