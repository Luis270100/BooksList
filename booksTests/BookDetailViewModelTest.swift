

import XCTest
@testable import books


class BookDetailViewModelTest: XCTestCase {
    
    
    let emptyBookDetail = BookDetail(id: "", bookId: 00, author: "", title: "", price: 0.0, genre: [], kind: "", description: "", imageName: "", isAvailable: false)
    
    var bookRepository : BookRepository!
    var viewModel : BookDetailView.BookDetailViewModel!
    

    override func setUp() {
        super.setUp();
        bookRepository = MockBookRepository();
        viewModel = BookDetailView.BookDetailViewModel(bookRepository: bookRepository)
        
    }
    
    override func tearDown() {
        super.tearDown();
        bookRepository = nil
        viewModel = nil
    }
    
    func test_toggle_navigation() {
        XCTAssertEqual(viewModel.canNavigateToCartView, false)
        viewModel.toggleNavigation()
        XCTAssertEqual(viewModel.canNavigateToCartView, true)
    }
    
    func test_show_alert() {
        XCTAssertTrue(viewModel.showAlert == false)
        viewModel.showBookAlert()
        XCTAssertTrue(viewModel.showAlert == true)
    }
    
    func test_hide_alert() {
        viewModel.showBookAlert()
        XCTAssertTrue(viewModel.showAlert == true)
        viewModel.hideBookAlert()
        XCTAssertTrue(viewModel.showAlert == false)
    }
    
    func test_get_book_detail() {
        // Arrange
        let bookDetail = BookDetail(id: "0", bookId: 0, author: "J. R. R. Tolkien", title: "The Fellowship of the Ring", price: 18.85, genre: [Genre.fantasy, Genre.action], kind: "Novel",description: "The Fellowship of the Ring is the first of three volumes in The Lord of the Rings, an epic set in the fictional world of Middle-earth. The Lord of the Rings is an entity named Sauron, the Dark Lord, who long ago lost the One Ring that contains much of his power. His overriding desire is to reclaim the Ring and use it to enslave all of Middle-earth.", imageName: "theFellowshipOfTheKing", isAvailable: false)
        // Act
        XCTAssertEqual(viewModel.bookDetail, nil)
        viewModel.getBookDetail(bookId: 0)
        
        // Assert
        XCTAssertEqual(viewModel.bookDetail, bookDetail)
        XCTAssertEqual(viewModel.bookImage, bookDetail.imageName)
        XCTAssertEqual(viewModel.bookTitle, bookDetail.title)
        XCTAssertEqual(viewModel.bookAuthor, bookDetail.author)
        XCTAssertEqual(viewModel.bookDescription, bookDetail.description)
        XCTAssertEqual(viewModel.bookPrice, bookDetail.price)
    }
    
    func test_parse_genre() {
        // Arrange
        let bookDetail = BookDetail(id: "0", bookId: 0, author: "", title: "", price: 18.85, genre: [Genre.economics, Genre.fantasy, Genre.action, Genre.history, Genre.present, Genre.drama, Genre.scienceFiction, Genre.business], kind: "",description: "", imageName: "", isAvailable: false)
        viewModel.bookDetail = bookDetail;
        
        // Act
        viewModel.parseGenre()
        
        // Assert
        XCTAssertEqual(viewModel.bookGenres, ["Economics", "Fantasy", "Action", "History", "Present", "Drama", "Science Fiction", "Business"])
    }
    
    func test_empty_list_of_genres() {
        // Arange
        let genres = ["Economics", "Fantasy", "Action", "History"];
        viewModel.bookGenres = genres;
        XCTAssertEqual(viewModel.bookGenres, genres)
        // Act
        viewModel.emptyListOfGenres()
        // Assert
        XCTAssertEqual(viewModel.bookGenres, [])
        
    }

}
