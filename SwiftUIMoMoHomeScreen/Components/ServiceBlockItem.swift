//
//  ServiceBlockItem.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import SwiftUI

struct ServiceBlockItem: View {
    let screenSize: CGRect = UIScreen.main.bounds
    let service: Feature
    var body: some View {
        Button(action: {
            
        }, label: {
            VStack {
                Image(service.value?.icon ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38, height: 38, alignment: .center)
                    .padding()
                    .background(
                        Circle().fill(.white)
                    )
                    .shadow(radius: 4,x: 2, y: 5)
                
                Text(service.value?.name ?? "")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 12))
                    .lineLimit(2)
                    .foregroundColor(.black)
                Spacer()
            }
        })
        .frame(width: screenSize.width/5, height: 120)
//        .background(.brown)
    }
}

struct ServiceBlockItem_Previews: PreviewProvider {
    static var previews: some View {
        ServiceBlockItem(service: Feature(appCode: "", appValueCode: "", createdTime: "", lastUpdatedTime: "", value: Value(defaultParam: "", description: "", extra: "", icon: "ic_voucher", key: "", language: "", name: "khuyến mãi da tang", port: "", query: "", refID: "", sortOrder: 2, special: "", status: 1, uri: "", user: "")))
            .frame(width: 70, height: 200)
            .background(.gray.opacity(0.4))
    }
}
