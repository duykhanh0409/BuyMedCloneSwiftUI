//
//  HomeViewBuyMed.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import SwiftUI

struct HomeViewBuyMed: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            ScrollView{
                headerView
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("tìm kiếm ....", text: .constant(""))
                }
                
            }
        }
    }
}

struct HomeViewBuyMed_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewBuyMed()
    }
}

extension HomeViewBuyMed {
    private var headerView: some View{
        HStack{
            Image("logo_thuocsi")
                .resizable()
                .scaledToFit()
                .frame(width: 130)
            Spacer()
            
            Image(systemName: "message")
            Image(systemName: "bell.and.waves.left.and.right")
            Image(systemName: "cart")
            
            Image(systemName: "person.circle")
                
        }
        .padding(.horizontal)
    }
}
