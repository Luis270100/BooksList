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
        ScrollView {
            VStack (spacing:16) {
                
                // Title
                VStack{
                    Text("Your bag")
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                    Text(String(viewModel.totalItems) + " items")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                
                // Item list
                ForEach(viewModel.items) { item in
                    CartRow(item: item)
                }
                                
                
                // Summary
                HStack () {
                    ZStack {
                        Text("FREE Shipping")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 64, height: 64)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(16)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Total:")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                        Text("$ \(viewModel.totalPrice, specifier: "%.2f")")
                            .font(.system(size: 34))
                            .fontWeight(.bold)
                    }
                }
                .padding()
                .frame(
                    maxWidth: .infinity,
                    alignment: .center
                )
                
                
                // Checkout button
                Button(action: {
                    viewModel.showCartAlert()
                }) {
                    HStack {
                        Text("Checkout")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                    }
                    .frame(width: 250)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(16)
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Order confirmed"),
                          message: Text("Thank you for your purchase."),
                          dismissButton: .default(Text("Done")) {
                        viewModel.hideCartAlert();
                    })
                }
                
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
            
        }
        .onAppear{
            viewModel.getItems()
            viewModel.getTotalItems();
            viewModel.getTotalPrice();
        }
    }
    
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
