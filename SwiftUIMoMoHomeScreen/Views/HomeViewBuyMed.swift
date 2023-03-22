//
//  HomeViewBuyMed.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import SwiftUI

struct HomeViewBuyMed: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.3)
                ScrollView{
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("tìm kiếm ...", text: .constant(""))
                            .tint(.white)
                    }
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .shadow(radius: 112,x: 0,y: 5)
                    
                }
            }
            .navigationBarTitle("")
                .navigationBarItems(
                leading: headerLeading,
                trailing: headerTrailing
                )
        }
      
    }
}

struct HomeViewBuyMed_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewBuyMed()
    }
}

extension HomeViewBuyMed {
    private var headerLeading: some View{
        Image("logo_thuocsi")
            .resizable()
            .scaledToFit()
            .frame(width: 130)
    }
    
    private var headerTrailing: some View{
        HStack {
            Image(systemName: "message")
            Image(systemName: "bell.and.waves.left.and.right")
            Image(systemName: "cart")
            
            Image(systemName: "person.circle")
        }
    }
    
    private var searchHeader: some View{
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("tìm kiếm ...", text: .constant(""))
                .tint(.white)
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(.white)
        .cornerRadius(10)
        .padding(.vertical)
        .padding(.horizontal)
        .shadow(radius: 112,x: 0,y: 5)
    }
}
