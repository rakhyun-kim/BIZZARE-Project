import SwiftUI

struct CartView: View {
    @EnvironmentObject var viewModel: ShopViewModel
    @Environment(\.dismiss) var dismiss
    @State private var showingPaymentAlert = false
    @State private var isProcessingPayment = false
    
    // 총 금액 계산
    var totalAmount: Double {
        viewModel.cartItems.reduce(0) { $0 + $1.price }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.cartItems.isEmpty {
                    // 장바구니가 비어있을 때
                    VStack(spacing: 20) {
                        Image(systemName: "cart")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("장바구니가 비어있습니다")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxHeight: .infinity)
                } else {
                    // 장바구니 아이템 목록
                    List {
                        ForEach(viewModel.cartItems) { item in
                            HStack {
                                // 상품 이미지
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 80, height: 80)
                                
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
                                    viewModel.removeFromCart(product: item)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        
                        // 총 금액 표시
                        Section {
                            HStack {
                                Text("총 금액")
                                    .font(.headline)
                                Spacer()
                                Text("₩\(Int(totalAmount))")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    // 결제 버튼
                    Button(action: {
                        showingPaymentAlert = true
                    }) {
                        HStack {
                            Text("결제하기")
                                .font(.headline)
                            Text("₩\(Int(totalAmount))")
                                .font(.headline)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                    }
                    .padding()
                    .disabled(isProcessingPayment)
                }
            }
            .navigationTitle("장바구니")
            .navigationBarItems(trailing: Button("닫기") {
                dismiss()
            })
            .alert("결제 확인", isPresented: $showingPaymentAlert) {
                Button("결제하기") {
                    processPayment()
                }
                Button("취소", role: .cancel) { }
            } message: {
                Text("총 \(Int(totalAmount))원을 결제하시겠습니까?")
            }
            .overlay {
                if isProcessingPayment {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .overlay {
                            ProgressView()
                                .tint(.white)
                                .scaleEffect(1.5)
                        }
                }
            }
        }
    }
    
    private func processPayment() {
        isProcessingPayment = true
        
        // 결제 처리를 시뮬레이션 (실제로는 결제 API를 호출해야 함)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isProcessingPayment = false
            viewModel.cartItems.removeAll() // 결제 완료 후 장바구니 비우기
            dismiss() // 장바구니 화면 닫기
        }
    }
}