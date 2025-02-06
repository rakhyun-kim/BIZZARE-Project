import Foundation

struct Product: Identifiable, Codable {
    let id: UUID
    var name: String
    var price: Double
    var description: String
    var quantity: Int
    var imageURL: String
    var category: String
    
    init(id: UUID = UUID(), name: String, price: Double, description: String = "", quantity: Int = 0, imageURL: String, category: String) {
        self.id = id
        self.name = name
        self.price = price
        self.description = description
        self.quantity = quantity
        self.imageURL = imageURL
        self.category = category
    }
}

// ProductManager 클래스 추가
class ProductManager {
    static let shared = ProductManager()
    private var products: [Product] = []
    
    private init() {}
    
    func addProduct(_ product: Product) -> Result<Product, ProductError> {
        // 기본적인 유효성 검사
        guard !product.name.isEmpty else {
            return .failure(.invalidName)
        }
        guard product.price >= 0 else {
            return .failure(.invalidPrice)
        }
        guard product.quantity >= 0 else {
            return .failure(.invalidQuantity)
        }
        
        products.append(product)
        return .success(product)
    }
    
    func getAllProducts() -> [Product] {
        return products
    }
}

enum ProductError: Error {
    case invalidName
    case invalidPrice
    case invalidQuantity
    
    var message: String {
        switch self {
        case .invalidName:
            return "상품명이 비어있습니다"
        case .invalidPrice:
            return "가격이 올바르지 않습니다"
        case .invalidQuantity:
            return "수량이 올바르지 않습니다"
        }
    }
} 