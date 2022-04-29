import Foundation

protocol CartRepository {
    func getItems() -> [Item]
    func getTotal() -> Double;
    func getTotalItems() -> Int;
    func insert(book : Book);
    func update(book : Book);
    func delete(book : Book);
    func clear();
}
