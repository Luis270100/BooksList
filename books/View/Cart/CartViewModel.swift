
import Foundation

extension CartView {
    
    class CartViewModel : ObservableObject {
        
        @Published var totalPrice = 0.0;
        @Published var items = [Item]();
        @Published var totalItems = 0;
        
        // Alert
        @Published var showAlert = false;
        
        
        // Repositories
        var cartRepository : CartRepository;
//        var bookRepository : BookRepository;
        
        
        // Constructor
        init(cartRepository: CartRepository = _CartRepositoryImplSingleton) {
            self.cartRepository = cartRepository;
        }
        
        func showCartAlert() {
            showAlert = true;
        }
        
        func hideCartAlert() {
            showAlert = false;
        }
        
        func getItems() {
            items = cartRepository.getItems();
            print(items);
        }
        
        func getTotalItems() {
            totalItems = cartRepository.getTotalItems();
        }
        
        func getTotalPrice() {
            totalPrice = cartRepository.getTotal();
        }
    }
}
