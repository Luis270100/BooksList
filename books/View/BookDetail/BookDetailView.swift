import SwiftUI

struct BookDetailView: View {
    
    @StateObject var viewModel : BookDetailViewModel;
    var bookId : Int;
    var bookRepository: BookRepository;
    var cartRepository: CartRepository;
    
    
    
    
    init(viewModel : BookDetailViewModel = .init(), bookId: Int,  bookRepositroy: BookRepository = BookRepositoryImpl(), cartRepository: CartRepository = _CartRepositoryImplSingleton) {
        _viewModel = StateObject(wrappedValue: viewModel);
        self.bookId = bookId;
        self.bookRepository = bookRepositroy;
        self.cartRepository = cartRepository;
    }
    
    
    var body: some View {
        VStack {
            NavigationLink("", destination: CartView(), isActive: $viewModel.canNavigateToCartView)
            VStack(alignment: .center, spacing: 20) {
                Image(viewModel.bookImage)
                    .resizable()
                    .frame(width: 150, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                Text(viewModel.bookAuthor).font(.system(size: 16)).bold().foregroundColor(.gray)
                Text(viewModel.bookTitle).font(.system(size: 24)).bold()
                Text(viewModel.bookDescription).font(.system(size: 16))
                HStack (spacing: 12){
                    ForEach(viewModel.bookGenres, id: \.self) { genre in
                        BookDetailGenre(genre: genre)
                    }
                }
                Button {
                    viewModel.addItem(bookId: bookId)
                    viewModel.showBookAlert();
                }label: {
                    Text("Buy for \(viewModel.bookPrice, specifier: "%.2f")")
                        .bold()
                }
                .alert("Book add to cart", isPresented:  $viewModel.showAlert) {
                    Button("OK", role: .cancel) {
                        viewModel.hideBookAlert()
                    }
                }
                .padding(18)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(12)
            }
        }
        .onAppear {
            viewModel.getBookDetail(bookId: bookId);
            viewModel.parseGenre();
        }
        .onDisappear{
            viewModel.emptyListOfGenres()
        }
        .navigationBarTitle("BookDetails", displayMode: .inline)
        .toolbar {
            ToolbarItem {
                Button{
                    viewModel.toggleNavigation();
                } label: {
                    ZStack (alignment: .center){
                        Text("\(viewModel.cartRepository.getTotalItems())").font(.system(size: 12)).padding(.top, 3).foregroundColor(Color.black);
                        Image(systemName: "bag").resizable().frame(width: 25, height: 25).foregroundColor(Color.black);
                    }
                }
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding(24)
    }
}



struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BookDetailView.BookDetailViewModel();
        let bookRepository = BookRepositoryImpl();
        let cartRepository = _CartRepositoryImplSingleton;
        BookDetailView(viewModel: viewModel, bookId: booksDetail[0].bookId, bookRepositroy: bookRepository, cartRepository: cartRepository);
    }
}
