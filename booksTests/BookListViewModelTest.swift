


@testable import books
import XCTest


class BookListViewModelTest: XCTestCase {
    
    var bookViewModel : BookListView.BookListViewModel!
    var bookRepository : BookRepository!
    
    override func setUp() {
        super.setUp()
        bookRepository = MockBookRepository();
        
        bookViewModel = BookListView.BookListViewModel(bookRepository: bookRepository);
    }
    
    override func tearDown() {
        bookViewModel = nil
        super.tearDown()
    }
    
    func test_getting_books() throws {
        // Act
        XCTAssertTrue(bookViewModel.books.count == 0)
        bookViewModel.getBooks()
        // Assert
        XCTAssertTrue(bookViewModel.books.count == 1)
        
    }
}
