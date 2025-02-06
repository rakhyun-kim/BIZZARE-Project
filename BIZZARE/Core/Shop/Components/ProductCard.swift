import SwiftUI

struct ProductCard: View {
    let product: Product
    @EnvironmentObject var viewModel: ShopViewModel
    @State private var showingAddToCartAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // 상품 이미지
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Text("Image")
                        .foregroundColor(.black)
                )
            
            // 상품 정보
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(product.name)
                        .font(.subheadline)
                        .lineLimit(2)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    // 장바구니 버튼
                    Button(action: {
                        addToCart()
                    }) {
                        Image(systemName: "cart.badge.plus")
                            .foregroundColor(.black)
                            .padding(6)
                            .background(
                                Circle()
                                    .fill(Color.white)
                                    .shadow(radius: 1)
                            )
                    }
                }
                
                Text("₩\(Int(product.price))")
                    .font(.headline)
                    .bold()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 4)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
        .alert("장바구니에 추가됨", isPresented: $showingAddToCartAlert) {
            Button("확인", role: .cancel) { }
        } message: {
            Text("\(product.name)이(가) 장바구니에 추가되었습니다.")
        }
    }
    
    private func addToCart() {
        // 이미 장바구니에 있는지 확인
        if !viewModel.cartItems.contains(where: { $0.id == product.id }) {
            viewModel.addToCart(product: product)
            showingAddToCartAlert = true
        } else {
            // 이미 장바구니에 있는 경우 처리
            showingAddToCartAlert = true
        }
    }
}