//
//  HomeView.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 05/03/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { proxy in
            let safeAreaTop = proxy.safeAreaInsets.top
            ScrollView(.vertical,showsIndicators: false) {
                VStack{
                    HeaderView(safeAreaTop)
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    @ViewBuilder
    func HeaderView(_ safeAreaTop: CGFloat) -> some View{
        VStack{
            HStack(spacing: 15) {
                HStack(spacing: 5) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(.trailing,10)
                    TextField("Search", text: .constant(""))
                        .tint(.red)
                }
                .padding(.vertical,10)
                .padding(.horizontal,15)
                .background{
                    RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .fill(.black)
                        .opacity(0.15)
                }
            }
        }
        .padding([.horizontal,.bottom],15)
        .padding(.top, safeAreaTop + 10)
        .background{
            Rectangle().fill(.red.gradient)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
