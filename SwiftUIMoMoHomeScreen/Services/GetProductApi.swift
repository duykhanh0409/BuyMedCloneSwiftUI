//
//  GetProductApi.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 25/03/2023.
//

import Foundation
import Combine

//{
//  "filter": null,
//  "getPrice": true,
//  "getTotal": true,
//  "text": "",
//  "sort": "",
//  "offset": 0,
//  "limit": 30,
//  "queryOption": {
//    "consumedMaxQuantity": true,
//    "sellerInfo": true
//  }
//}
class ProductApi {
    @Published var dataProduct:ProductModel? = nil
    
    private var dataProductScription: AnyCancellable?
    let queryData = ["filter": nil,
                     "getPrice": true,
                     "getTotal": true,
                     "text": "",
                     "sort":"",
                     "offset": 0,
                     "limit": 30,
                     "queryOption": [
                         "consumedMaxQuantity": true,
                         "sellerInfo": true
                       ]
    ] as [String : Any?]
    
    func getDataProductWithCombine() {
        let url = "/marketplace/frontend-apis/v1/search/fuzzy"
        dataProductScription = NetworkingManager.fetchData(url: url, method: "POST", isQuery: false, querys: queryData as [String : Any])
            .decode(type: ProductModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (responseDataProduct) in
                self?.dataProduct = responseDataProduct
                self?.dataProductScription?.cancel()
            })
        
    }
}
