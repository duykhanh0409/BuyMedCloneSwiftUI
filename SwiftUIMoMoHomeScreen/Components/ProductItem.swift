//
//  ProductItem.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 26/03/2023.
//

import SwiftUI

struct ProductItemView: View {
    let screenSize: CGRect = UIScreen.main.bounds
    var body: some View {
        VStack(alignment:.leading,spacing: 0) {
            ZStack(alignment:.topTrailing) {
//                Image("anh1")
//                   .resizable()
//                   .cornerRadius(10)
//                   .aspectRatio(contentMode: .fit)
//                   .frame(width:150)
//                   .scaledToFit()
//                   .padding(.top, 35)
//                           .background(Color.yellow)
                ImageContainerView(image: "anh1")
                    .frame(width:150, height: 150)
                    .padding(.top, 35)
                Image(systemName: "heart")
                    .padding(.top)
                    .foregroundColor(.gray)
                    
            }
           
            VStack(alignment: .leading) {
                Text("Thuốc trị bệnh")
                Text("183 Hộp X30 Viên")
            }
            .padding(.vertical,10)
            Spacer()
            Text("1.000.000đ")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom)
        }

        .frame(width: (screenSize.width - 30)/2, height: 320)
        
//                .background(.blue)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView()
    }
}
