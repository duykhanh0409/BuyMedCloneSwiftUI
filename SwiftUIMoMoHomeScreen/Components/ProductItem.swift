//
//  ProductItem.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 26/03/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductItemView: View {
    let screenSize: CGRect = UIScreen.main.bounds
    let item: ProductItem
    var body: some View {
        VStack {
            sectionImageHeader
            
            sectionTitleDescription
            
            Spacer()
                
            sectionPrice
        
        }
        .frame(width: (screenSize.width - 30)/2, height: 320)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.3), lineWidth: 1))
    }
}
//
struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(item: ProductItem(consumedMaxQuantity: ConsumedMaxQuantity(maxQuantityCampaign: 50, maxQuantityConsumed: 100, maxQuantityDeal: 100, maxQuantityPerDay: 20, maxQuantityPerOrder: 20, maxQuantitySku: 30, maxQuantityType: nil, quantityPurchasedCampaign: 30, quantityPurchasedDeal: 50, quantityPurchasedToday: 10, viewedMaxQuantityPerDay: 30, viewedMaxQuantityPerOrder: 40), isAvailable: true, product: DatumProduct(atc2Code: nil, atc3Code: nil, brand: nil, categoryCodes: nil, code: nil, efficacyCodes: nil, imageUrls: ["https://storage.googleapis.com/thuocsi-testing/images/20221b2f1ecf4f51434f95e1c9d63f7e"], ingredients: nil, isCombo: nil, isFragile: nil, isFrozen: nil, isIngredientSpecial: nil, manufacturerCode: nil, name: "Khanh", note: nil, origin: nil, originName: "duy khanh", owner: nil, productID: nil, registrationNumber: nil, retailUnitQuantityPerUnit: nil, searchKeyword: nil, sellerSubCategoryCode: nil, similarProductCodes: nil, slug: nil, subProducts: nil, unit: nil, usage: nil, volume: nil, sellerCategoryCode: nil, height: nil, length: 300, weight: 300, width: 300, dosageForm: nil), sellerInfo: SellerInfo(avatar: nil, displayName: nil, isStore: true, isVip: true, sellerCode: nil, sellerID: 30, sellerName: "Truc Phan", sellerType: nil, slug: nil), sku: nil, skuLimit: nil, deal: nil))
    }
}


extension ProductItemView {
    private var sectionPrice: some View {
        VStack(spacing: 0) {
            Text("\(item.sku?.purchasePrice ?? 0)")
                .font(.title2)
                .fontWeight(.semibold)
//                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
              
              Text("Đặt tối đa 50 hộp/lần và 70 hộp/ngày ")
                .font(.caption)
                .fontWeight(.thin)
                .padding(.bottom)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal,12)
    }
    
    private var sectionImageHeader: some View {
        VStack(alignment:.center,spacing: 0) {
            ZStack(alignment:.topTrailing) {
//                    var image = print("khanh link image", item.product?.imageUrls?[0] ?? "")
                ImageContainerView(image:item.product?.imageUrls?[0] ?? "")
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal,12)
                    .padding(.top, 35)
                Image(systemName: "heart")
                    .padding(.top, 8)
                    .padding(.trailing,5)
                    .foregroundColor(.gray)
            }
        }
    }
    
    private var sectionTitleDescription: some View {
        VStack(alignment: .leading, spacing: 0) {
                      Text("Thuốc trị bệnh")
                      Text("183 Hộp X30 Viên")
                  }
                  .padding(.vertical,10)
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.horizontal,12)
    }
}
