import SwiftUI

struct BookDetailView: View {
    
    var bookId : Int;
    @StateObject var viewModel : BookDetailViewModel;
    
    init(bookId: Int, viewModel : BookDetailViewModel = .init()) {
        self.bookId = bookId;
        _viewModel = StateObject(wrappedValue: viewModel);
    }
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(viewModel.bookImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            Text(viewModel.bookAuthor).font(.system(size: 16)).bold().foregroundColor(.gray)
            Text(viewModel.bookTitle).font(.system(size: 24)).bold()
            Text(viewModel.bookDescription)
            HStack (spacing: 12){
                ForEach(viewModel.bookGenres, id: \.self) { genre in
                    BookDetailGenre(genre: genre)
                }
            }
            Button(action: {}){
                Text("Buy for \(viewModel.bookPrice, specifier: "%.2f")")
                    .bold()
            }
            .onAppear {
                viewModel.getBookDetail(bookId: bookId);
                viewModel.parseGenre();
            }            
            .onDisappear{
                viewModel.emptyListOfGenres()
            }
            .padding(20)
            .foregroundColor(Color.white)
            .background(Color.black)
            .cornerRadius(12)
        }
        .padding(24)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
    
    
}



struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BookDetailView.BookDetailViewModel();
        BookDetailView(bookId: booksDetail[0].bookId, viewModel: viewModel)
    }
}
