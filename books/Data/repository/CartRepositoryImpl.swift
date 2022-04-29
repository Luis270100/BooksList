import Foundation


class CartRepositoryImpl : CartRepository {
    
    static let cartRepository = CartRepositoryImpl();
    
    private init(){}
    
    var cart = Cart(items: [], numberOfItems: 0, total: 0.0);
    
    func getItems() -> [Item] {
        return cart.items;
    }
    
    func getTotal() -> Double {
        return cart.total;
    }
    
    func getTotalItems() -> Int {
        return cart.numberOfItems;
    }
    
    func insert(book: Book) {
        cart.items.append(Item(id: UUID().uuidString, item: book, units: 1))
    }
    
    func update(book: Book) {
        if let index = (cart.items.firstIndex{ $0.item.id == book.id }) {
            cart.items[index].units += 1;
            cart.total += book.price;
            cart.numberOfItems += 1;
        }
    }
    
    func delete(book: Book) {
        if let index = (cart.items.firstIndex{ $0.item.id == book.id }) {
            cart.items.remove(at: index);
            cart.total -= book.price;
            cart.numberOfItems -= 1;
        }
    }
    
    func clear() {
        cart.items.removeAll();
        cart.total = 0.0;
        cart.numberOfItems = 0;
    }
}


let _CartRepositoryImplSingleton = CartRepositoryImpl.cartRepository;
