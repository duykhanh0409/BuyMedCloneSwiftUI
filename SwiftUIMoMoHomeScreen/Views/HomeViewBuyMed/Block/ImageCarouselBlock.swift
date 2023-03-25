//
//  ImageCarouselBlock.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 25/03/2023.
//

import SwiftUI
import Combine
struct ImageCarouselView<Content: View>: View {
    private var numberOfImages: Int
    private var content: Content

    @State private var currentIndex: Int = 2
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
        self.numberOfImages = numberOfImages
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                TabView(selection: $currentIndex){
//                    self.content
//                }
//                .tabViewStyle(PageTabViewStyle())
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//                .onReceive(self.timer) { _ in
//                    self.currentIndex = self.currentIndex < 3 ? self.currentIndex + 1 : 0
//                }
//            }
//            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
//            .animation(.spring())
            
            HStack(spacing: 0) {
                           self.content
                       }
                       .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                       .offset(x: CGFloat(self.currentIndex) * -geometry.size.width, y: 0)
                       .animation(.spring())
                       .onReceive(self.timer) { _ in
                           print("khanh self.currentIndex",self.currentIndex)
                           self.currentIndex = (self.currentIndex + 1) % 3
                       }
        }
    }
}
