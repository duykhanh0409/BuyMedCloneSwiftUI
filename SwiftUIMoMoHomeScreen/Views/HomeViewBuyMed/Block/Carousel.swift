//
//  Carousel.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 25/03/2023.
//

import SwiftUI

struct Carousel: View {
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentIndex: Int = 2
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $currentIndex){
                Image("anh4")
                        .resizable()
                Image("anh2")
                    .resizable()
                 
                Image("anh3")
                    .resizable()
                    .scaledToFit()
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .frame(width: geometry.size.width, height: geometry.size.height / 3)
            .onReceive(timer) { _ in
                currentIndex = currentIndex < 3 ? currentIndex + 1 : 0
            }
        }
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel()
    }
}
