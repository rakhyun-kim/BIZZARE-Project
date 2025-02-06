import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var viewModel: ShopViewModel
    @Environment(\.dismiss) var dismiss
    @State private var showingAddToCartAlert = false
    @State private var showingCart = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // 상품 이미지
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        Text("Image")
                            .foregroundColor(.gray)
                    )
                
                VStack(alignment: .leading, spacing: 16) {
                    // 상품 기본 정보
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(product.name)
                                .font(.title2)
                                .bold()
                            
                            Spacer()
                            
                            Button(action: {
                                addToCart()
                            }) {
                                Image(systemName: "cart.badge.plus")
                                    .foregroundColor(.black)
                                    .padding(8)
                                    .background(
                                        Circle()
                                            .fill(Color.white)
                                            .shadow(radius: 1)
                                    )
                            }
                        }
                        
                        Text("₩\(Int(product.price))")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    
                    // 수량 정보
                    HStack {
                        Text("재고")
                            .font(.subheadline)
                        Text("\(product.quantity)개")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    // 상품 설명
                    VStack(alignment: .leading, spacing: 8) {
                        Text("상품 설명")
                            .font(.headline)
                        Text(product.description)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 8)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert("장바구니에 추가됨", isPresented: $showingAddToCartAlert) {
            Button("장바구니로 이동") {
                showingCart = true
            }
            Button("계속 쇼핑하기", role: .cancel) { }
        } message: {
            Text("\(product.name)이(가) 장바구니에 추가되었습니다.")
        }
        .sheet(isPresented: $showingCart) {
            CartView()
        }
    }
    
    private func addToCart() {
        if !viewModel.cartItems.contains(where: { $0.id == product.id }) {
            viewModel.addToCart(product: product)
        }
        showingAddToCartAlert = true
    }
}

#Preview {
    NavigationView {
        ProductDetailView(product: Product(
            name: "Sample Product",
            price: 99.99,
            description: "This is a sample product description that explains the features and benefits of the product.",
            quantity: 10,
            imageURL: "sample_image",
            category: "ALL"
        ))
        .environmentObject(ShopViewModel())
    }
} 