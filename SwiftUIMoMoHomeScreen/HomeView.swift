//
//  HomeView.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 05/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var offsetY: CGFloat = 0
    var body: some View {
        
        GeometryReader { proxy in
            let safeAreaTop = proxy.safeAreaInsets.top
            ScrollView(.vertical,showsIndicators: false) {
                VStack{
                    HeaderView(safeAreaTop)
                        .offset(y:0)
                        .zIndex(1)
                    
                    //scroll content here
                    VStack{
                        ForEach(1...10,id: \.self) { _ in
                            RoundedRectangle(cornerRadius: 10,style: .continuous)
                                .fill(.blue.gradient)
                                .frame(height:200)
                        }
                    }
                    .padding(15)
                    .zIndex(0)
                }
                .offset(coordinateSpace: .named("SCROLL")) { offset in
                    offsetY = offset
                    print(offsetY)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .coordinateSpace(name: "SCROLL")
        }
    }
    
    @ViewBuilder
    func HeaderView(_ safeAreaTop: CGFloat) -> some View{
        //Reduce header Hight will be 80
        let progress = -(offsetY/80) > 1 ? -1 : (offsetY < 0 ? 0 : (offsetY / 80))
        VStack{
            HStack(spacing: 15) {
                HStack(spacing: 5) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(.trailing,10)
                    TextField("Search", text: .constant(""))
                        .tint(.white)
                }
                .padding(.vertical,10)
                .padding(.horizontal,15)
                .background{
                    RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .fill(.black)
                        .opacity(0.15)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 35,height: 35)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .background{
                            Circle().fill(.white)
                                .padding(-2)
                        }
                    
                }

            }
            HStack(spacing: 0){
                CustomButton(symBolImage:
                                "rectangle.portrait.and.arrow.forward", title: "Deposit"){}
                CustomButton(symBolImage:
                                "dollarsign", title: "WithDraw"){}
                CustomButton(symBolImage:
                                "qrcode", title: "QRCode"){}
                CustomButton(symBolImage:
                                "qrcode.viewfinder", title: "Scanning"){}
            }
            .padding(.top,10)
//            .offset(y: progress * 65)
        }
        .padding([.horizontal,.bottom],15)
        .padding(.top, safeAreaTop + 10)
        .background{
            Rectangle().fill(.red.gradient)
        }
    }
    
    @ViewBuilder
    func CustomButton(symBolImage: String, title:String, onClick: @escaping()->()) ->some View{
        Button {
            
        } label: {
            VStack(spacing: 8 ){
                Image(systemName: symBolImage)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
                    .frame(width: 35,height: 35)
                    .background{
                        RoundedRectangle(cornerRadius: 8,style: .continuous)
                            .fill(.white)
                    }
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth:.infinity)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//MARK : offet reference key

struct offsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func offset(coordinateSpace: CoordinateSpace, completion: @escaping (CGFloat)->())-> some View{
        self.overlay {
            GeometryReader { proxy in
                let minY = proxy.frame(in: coordinateSpace).midY
                Color.clear
                    .preference(key: offsetKey.self, value: minY)
                    .onPreferenceChange(offsetKey.self) { value in
                        completion(value)
                    }
            }
        }
    }
}

