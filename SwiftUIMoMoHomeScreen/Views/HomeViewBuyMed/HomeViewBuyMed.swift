//
//  HomeViewBuyMed.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import SwiftUI

struct HomeViewBuyMed: View {
    @StateObject private var vm = HomeViewModel()
    @State private var searchText = ""
    let images = ["anh1","anh2","anh3"]
   
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1)
                ScrollView{
                    searchHeader
                    ServiceBlock(listService: vm.dataServices)
                    GeometryReader { geometry in
                                    ImageCarouselView(numberOfImages: 3) {
                                        Image("anh1")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipped()
                                            .tag("anh1")
                                        Image("anh2")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipped()
                                            .tag("anh2")
                                        Image("anh3")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .clipped()
                                            .tag("anh3")
                                    }
                                }.frame(height: 300, alignment: .center)
                }
            }
            .onAppear {
//                vm.getDataServiceFromInternal()
                vm.getDataServiceFromInternalFromCombine()
                vm.getDataBannerHome()

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
            TextField("tìm kiếm ...", text: $searchText)
                .tint(.white)
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(.white)
        .cornerRadius(20)
        .padding(.vertical)
        .padding(.horizontal)
        .shadow(radius: 6,x: 0.3,y: 1)
    }
}
