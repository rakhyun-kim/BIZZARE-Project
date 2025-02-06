import Foundation

class ShopViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(
            name: "Basic T-Shirt", 
            price: 29.99, 
            description: "편안한 기본 티셔츠",
            quantity: 10,
            imageURL: "tshirt", 
            category: "TOP"
        ),
        Product(
            name: "Denim Jeans", 
            price: 89.99, 
            description: "클래식한 데님 진",
            quantity: 5,
            imageURL: "jeans", 
            category: "BOTTOM"
        ),
        Product(
            name: "Sneakers", 
            price: 119.99, 
            description: "편안한 스니커즈",
            quantity: 8,
            imageURL: "sneakers", 
            category: "SHOES"
        ),
        Product(
            name: "Watch", 
            price: 299.99, 
            description: "세련된 시계",
            quantity: 3,
            imageURL: "watch", 
            category: "ACCESSORIES"
        )
    ]
    @Published var cartItems: [Product] = []
    @Published var searchResults: [Product] = []
    @Published var filteredProducts: [Product] = []
    
    init() {
        searchResults = products
        filteredProducts = products
    }
    
    func filterProducts(by category: String) {
        if category == "ALL" {
            filteredProducts = products
        } else {
            filteredProducts = products.filter { $0.category == category }
        }
    }
    
    func searchProducts(query: String) {
        if query.isEmpty {
            searchResults = filteredProducts
        } else {
            searchResults = filteredProducts.filter { product in
                product.name.lowercased().contains(query.lowercased()) ||
                product.category.lowercased().contains(query.lowercased())
            }
        }
    }
    
    func addToCart(product: Product) {
        // 이미 장바구니에 있는지 확인
        if !cartItems.contains(where: { $0.id == product.id }) {
            cartItems.append(product)
        }
    }
    
    func removeFromCart(product: Product) {
        cartItems.removeAll { $0.id == product.id }
    }
    
    // 장바구니에 있는지 확인하는 함수 추가
    func isInCart(product: Product) -> Bool {
        return cartItems.contains(where: { $0.id == product.id })
    }
} 