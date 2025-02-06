import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // 메인 배너
                    Image("main_banner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                    
                    // 신상품 섹션
                    VStack(alignment: .leading) {
                        Text("NEW ARRIVALS")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(0..<5) { _ in
                                    ProductCard(product: Product(
                                        name: "Sample Product",
                                        price: 99.99,
                                        description: "샘플 상품입니다",
                                        quantity: 5,
                                        imageURL: "sample_image",
                                        category: "ALL"
                                    ))
                                    .frame(width: 150)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("HOME")
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ShopViewModel())
} 