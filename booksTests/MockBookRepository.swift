//
//  MockBookRepository.swift
//  booksTests
//
//  Created by Luis Arturo Hernandez on 29/06/22.
//

import Foundation
@testable import books


final class MockBookRepository : BookRepository {
    
    func getBooks() -> [Book] {
        return [Book(id: 0, title: "The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 18.85, imageName: "theFellowshipOfTheKing")]
    }
    
    func getBookDetail(bookId: Int) -> BookDetail {
        return  BookDetail(id: "0", bookId: 0, author: "J. R. R. Tolkien", title: "The Fellowship of the Ring", price: 18.85, genre: [Genre.fantasy, Genre.action], kind: "Novel",description: "The Fellowship of the Ring is the first of three volumes in The Lord of the Rings, an epic set in the fictional world of Middle-earth. The Lord of the Rings is an entity named Sauron, the Dark Lord, who long ago lost the One Ring that contains much of his power. His overriding desire is to reclaim the Ring and use it to enslave all of Middle-earth.", imageName: "theFellowshipOfTheKing", isAvailable: false)
    }
    
    func getBook(bookId: Int) -> Book {
        Book(id: 0, title: "The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 18.85, imageName: "theFellowshipOfTheKing")
    }
    
    
    
}
