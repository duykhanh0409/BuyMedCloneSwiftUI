//
//  ProductBlock.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 26/03/2023.
//

import SwiftUI

struct ProductBlock: View {
    
//    let dataTest = ProductItem(consumedMaxQuantity: <#T##ConsumedMaxQuantity?#>, isAvailable: <#T##Bool?#>, product: <#T##DatumProduct?#>, sellerInfo: <#T##SellerInfo?#>, sku: <#T##DatumSku?#>, skuLimit: <#T##SkuLimit?#>, deal: <#T##Deal?#>)
    let screenSize: CGRect = UIScreen.main.bounds
    var body: some View {
        VStack(alignment:.leading) {
            Text("Sản phẩm bán chạy")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top,20)
            ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<3) { index in
                            ProductItemView()
                        }

                    }
                    .padding(.horizontal)
                    .padding(.vertical,10)
            }
        }
        .padding(.bottom,30)
    }
}

struct ProductBlock_Previews: PreviewProvider {
    static var previews: some View {
        ProductBlock()
    }
}
