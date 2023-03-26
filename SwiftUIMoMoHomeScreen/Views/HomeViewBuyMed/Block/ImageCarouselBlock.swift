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

    @State private var currentIndex: Int = 0
    
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
        self.numberOfImages = numberOfImages
        self.content = content()
    }
    

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                TabView(selection: $currentIndex){
                    self.content
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .clipShape(RoundedRectangle(cornerRadius:10))
                .padding(.horizontal,20)
                .overlay(content: {
                    controlPage
                })
                .onReceive(self.timer) { _ in
//                    print("khanh currentIndex", self.currentIndex)
                    withAnimation {
                        self.currentIndex = self.currentIndex < 3 ? self.currentIndex + 1 : 0
                    }
                }
            }
            .frame(width: geometry.size.width , height: geometry.size.height, alignment: .center)
            .animation(.spring())
    
        }
    }
}

extension ImageCarouselView {
    private var controlPage: some View{
        HStack{
            Button {
                withAnimation {
                    currentIndex = currentIndex > 0 ? currentIndex - 1 : numberOfImages - 1
                }
               
            } label: {
                Image(systemName: "chevron.left")
                    .padding(10)
                    .background(
                        Circle().fill(.white)
                    )
            }
            Spacer()
            Button {
                withAnimation {
                    currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
                }
            } label: {
                Image(systemName: "chevron.right")
                    .padding(10)
                    .background(
                        Circle().fill(.white)
                    )
            }
        }
        .padding(.horizontal,5)
        
    }
}


extension ImageCarouselView {
    private var body2: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
            .offset(x: CGFloat(self.currentIndex) * -geometry.size.width, y: 0)
            .animation(.spring())
            .overlay(alignment: .bottom,content: {
                controlPage
                HStack(spacing: 5){
                    ForEach(0..<numberOfImages) { index in
                        var isEnable = self.currentIndex == index
                        Circle()
                            .strokeBorder(Color.blue,lineWidth: 1)
                            .frame(width: 10,height: 10)
                            .background(Circle().foregroundColor(isEnable ? Color.green : Color.white))
                    }
                }
                .padding(.bottom)
            })
            .onReceive(self.timer) { _ in
                print("khanh self.currentIndex",self.currentIndex)
                self.currentIndex = (self.currentIndex + 1) % 3
            }
        }
    }
}
