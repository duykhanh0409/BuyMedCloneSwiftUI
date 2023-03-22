//
//  ServiceBlockItem.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import SwiftUI

struct ServiceBlockItem: View {
    let screenSize: CGRect = UIScreen.main.bounds
    var body: some View {
        VStack {
            Image("ic_coupon")
                .resizable()
                .scaledToFit()
                .frame(width: screenSize.width/8, height: screenSize.width/8)
                .padding()
                .background(
                    Circle().fill(.white)
                )
                .shadow(radius: 4,x: 2, y: 5)
            
        }
    }
}

struct ServiceBlockItem_Previews: PreviewProvider {
    static var previews: some View {
        ServiceBlockItem()
            .frame(width: 200, height: 200)
            .background(.gray.opacity(0.4))
    }
}
