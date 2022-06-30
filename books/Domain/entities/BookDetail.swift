import Foundation


struct BookDetail: Equatable {
    var id: String;
    var bookId: Int;
    var author: String;
    var title: String;
    var price: Double;
    var genre: [Genre];
    var kind: String;
    var description: String;
    var imageName: String;
    var isAvailable: Bool;
}


enum Genre : CaseIterable{
    case fantasy, action, history, present, drama, scienceFiction, business, economics        
}
