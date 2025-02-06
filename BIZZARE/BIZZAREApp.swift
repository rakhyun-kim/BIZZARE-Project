//
//  BIZZAREApp.swift
//  BIZZARE
//
//  Created by Rakhyun Kim on 2/6/25.
//

import SwiftUI

@main
struct BIZZAREApp: App {
    @StateObject private var shopViewModel = ShopViewModel()
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environmentObject(shopViewModel)
        }
    }
}
