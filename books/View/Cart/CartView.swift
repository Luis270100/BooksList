import SwiftUI



struct CartView: View {
    
    @StateObject var viewModel : CartViewModel;
    var bookRepository: BookRepository;
    var cartRepository: CartRepository;
    
    
    init(viewModel : CartViewModel = .init(), bookRepositroy: BookRepository = BookRepositoryImpl(), cartRepository: CartRepository = _CartRepositoryImplSingleton) {
        _viewModel = StateObject(wrappedValue: viewModel);
        self.bookRepository = bookRepositroy;
        self.cartRepository = cartRepository;
    }
    
    @SwiftUI.Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                // Dismiss button
                HStack() {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("iconClose")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(20)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                // Title
                VStack {
                    Text("Your bag")
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                    Text(String(viewModel.totalItems) + " items")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                // Item list
                VStack(alignment: .leading) {
                    ForEach(viewModel.items) { item in
                        // CartRow(item: item)
                    }
                }
                
                
                Spacer().frame(height: 20)
                // Summary
                HStack {
                    VStack {
                        Image("shipping")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(.bottom, -8)
                        Text("FREE")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                    }
                    .frame(width: 64, height: 64)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(15)
                    
                    
                    Spacer().frame(width: 40)
                    VStack(alignment: .leading) {
                        Text("Total:")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                        Text("$ \(viewModel.totalPrice, specifier: "%.2f")")
                            .font(.system(size: 34))
                            .fontWeight(.bold)
                    }
                    Spacer().frame(width: 80)
                }
                // Checkout button
                Divider().padding()
                Button(action: {
                    viewModel.showCartAlert()
                }) {
                    HStack {
                        Text("Checkout")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                    }
                    .frame(width: 200)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(40)
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Order confirmed"),
                          message: Text("Thank you for your purchase."),
                          dismissButton: .default(Text("Done")) {
                        viewModel.hideCartAlert();
                    })
                }
            }
        }
        .onAppear{
            viewModel.getItems()
            viewModel.getTotalItems();
            viewModel.getTotalPrice();
        }
    }
}
