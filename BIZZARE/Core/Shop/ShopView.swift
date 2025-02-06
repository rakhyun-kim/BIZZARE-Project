import SwiftUI

struct ShopView: View {
    @EnvironmentObject var viewModel: ShopViewModel
    @State private var selectedCategory = "ALL"
    @State private var showingCart = false
    @State private var showingSearch = false
    
    let categories = ["BRANDS", "ALL", "OUTWEAR", "TOP", "BOTTOM", "SHOES", "ACCESSORIES", "SALE"]
    
    var body: some View {
        NavigationView {
            VStack {
                // 카테고리 스크롤 뷰
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                                viewModel.filterProducts(by: category)
                            }) {
                                Text(category)
                                    .foregroundColor(selectedCategory == category ? .black : .gray)
                                    .fontWeight(selectedCategory == category ? .bold : .regular)
                            }
                        }
                    }
                    .padding()
                }
                
                // 상품 그리드
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        ForEach(viewModel.filteredProducts) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                ProductCard(product: product)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("SHOP")
            .foregroundColor(.black)
            .navigationBarItems(trailing: HStack {
                Button(action: { showingSearch.toggle() }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
                
                Button(action: { showingCart.toggle() }) {
                    Image(systemName: "cart")
                        .foregroundColor(.black)
                }
            })
        }
        .sheet(isPresented: $showingSearch) {
            SearchView()
        }
        .sheet(isPresented: $showingCart) {
            CartView()
        }
    }
}

#Preview {
    ShopView()
        .environmentObject(ShopViewModel())
} 
