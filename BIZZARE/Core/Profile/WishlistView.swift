import SwiftUI

struct WishlistView: View {
    @EnvironmentObject var viewModel: ShopViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.wishlistItems.isEmpty {
                VStack(spacing: 20) {
                    Image(systemName: "heart")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    Text("위시리스트가 비어있습니다")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .navigationTitle("위시리스트")
            } else {
                List {
                    ForEach(viewModel.wishlistItems) { item in
                        NavigationLink(destination: ProductDetailView(product: item)) {
                            HStack {
                                // 상품 이미지
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 60, height: 60)
                                
                                // 상품 정보
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    Text("₩\(Int(item.price))")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                                
                                // 삭제 버튼
                                Button(action: {
                                    viewModel.removeFromWishlist(product: item)
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("위시리스트")
            }
        }
    }
} 