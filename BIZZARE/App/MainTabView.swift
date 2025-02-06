import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                
                ShopView()
                    .tag(1)
                
                ProfileView()
                    .tag(2)
            }
            
            // Custom Tab Bar
            HStack(spacing: 0) {
                ForEach(0..<3) { index in
                    VStack(spacing: 4) {
                        Circle()
                            .fill(selectedTab == index ? .black : .clear)
                            .frame(width: 4, height: 4)
                        
                        Button(action: {
                            selectedTab = index
                        }) {
                            Text(tabTitle(for: index))
                                .font(.caption)
                                .foregroundColor(selectedTab == index ? .black : .gray)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 8)
            .padding(.bottom, 4)
            .background(Color.white)
        }
    }
    
    private func tabTitle(for index: Int) -> String {
        switch index {
        case 0: return "HOME"
        case 1: return "SHOP"
        case 2: return "PROFILE"
        default: return ""
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(ShopViewModel())
} 