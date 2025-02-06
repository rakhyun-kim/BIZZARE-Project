import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("쇼핑 정보").foregroundColor(.black)) {
                    NavigationLink("주문 내역") {
                        Text("주문 내역")
                    }
                    .foregroundColor(.black)
                    NavigationLink("배송지 관리") {
                        Text("배송지 관리")
                    }
                    .foregroundColor(.black)
                    NavigationLink("위시리스트") {
                        WishlistView()
                    }
                    .foregroundColor(.black)
                }
                
                Section(header: Text("고객 센터").foregroundColor(.black)) {
                    NavigationLink("공지사항") {
                        Text("공지사항")
                    }
                    .foregroundColor(.black)
                    NavigationLink("자주 묻는 질문") {
                        Text("자주 묻는 질문")
                    }
                    .foregroundColor(.black)
                    NavigationLink("1:1 문의") {
                        Text("1:1 문의")
                    }
                    .foregroundColor(.black)
                }
                
                Section(header: Text("앱 정보").foregroundColor(.black)) {
                    HStack {
                        Text("버전")
                            .foregroundColor(.black)
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle("프로필")
        }
    }
}

#Preview {
    ProfileView()
} 