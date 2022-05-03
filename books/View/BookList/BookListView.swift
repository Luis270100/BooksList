import SwiftUI


struct BookListView: View {
    @StateObject var viewModel : BookListViewModel;
    
    init(viewModel: BookListViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel);
    }
    
    var body: some View {
        NavigationView {
            List (viewModel.books) { book in
                BookRow(book: book);
            }
            .navigationTitle("Books List")
        }
        .accentColor(.black)
        .onAppear(perform: viewModel.getBooks);
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BookListView.BookListViewModel()
        BookListView(viewModel: viewModel);
    }
}
