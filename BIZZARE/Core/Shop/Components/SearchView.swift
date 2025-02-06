import SwiftUI

struct SearchView: View {
    @EnvironmentObject var viewModel: ShopViewModel
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // 검색 바
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("검색어를 입력하세요", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: searchText) { newValue in
                            viewModel.searchProducts(query: newValue)
                        }
                }
                .padding()
                
                // 검색 결과
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        ForEach(viewModel.searchResults) { product in
                            ProductCard(product: product)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("검색")
            .navigationBarItems(trailing: Button("닫기") {
                dismiss()
            })
        }
    }
}

#Preview {
    SearchView()
        .environmentObject(ShopViewModel())
} 