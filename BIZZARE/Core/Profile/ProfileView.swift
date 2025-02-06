import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("쇼핑 정보")) {
                    NavigationLink("주문 내역") {
                        Text("주문 내역")
                    }
                    NavigationLink("배송지 관리") {
                        Text("배송지 관리")
                    }
                    NavigationLink("위시리스트") {
                        Text("위시리스트")
                    }
                }
                
                Section(header: Text("고객 센터")) {
                    NavigationLink("공지사항") {
                        Text("공지사항")
                    }
                    NavigationLink("자주 묻는 질문") {
                        Text("자주 묻는 질문")
                    }
                    NavigationLink("1:1 문의") {
                        Text("1:1 문의")
                    }
                }
                
                Section(header: Text("앱 정보")) {
                    HStack {
                        Text("버전")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
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