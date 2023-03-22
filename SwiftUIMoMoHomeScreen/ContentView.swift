//
//  ContentView.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 04/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeViewBuyMed()
                .tabItem {
                    Image(systemName: "house")
                        .foregroundColor(.white)
                    Text("Trang chủ")
                }
            DiscoveryView()
                .tabItem {
                    Image(systemName: "network")
                        .foregroundColor(.white)
                    Text("Khám phá")
                }
            QuickView()
                .tabItem {
                    Image(systemName: "cart")
                        .foregroundColor(.white)
                    Text("Xem Nhanh")
                }
            StoreView()
                .tabItem {
                    Image(systemName: "homekit")
                        .foregroundColor(.white)
                    Text("Cửa hàng")
                }
            PromotionView()
                .tabItem {
                    Image("ic_coupon")
                        .foregroundColor(.white)
                    Text("Khuyến mãi")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
