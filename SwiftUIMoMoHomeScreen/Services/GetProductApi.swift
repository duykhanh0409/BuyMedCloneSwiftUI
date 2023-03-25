//
//  GetProductApi.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 25/03/2023.
//

import Foundation
import Combine

class ProductApi {
    @Published var dataProduct:ProductModel? = nil
    
    private var dataProductScription: AnyCancellable?
    
    func getDataProductWithCombine() {
        let url = "/marketplace/frontend-apis/v1/search/fuzzy"
        dataProductScription = NetworkingManager.fetchData(url: url, method: "GET")
            .decode(type: ProductModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (responseDataProduct) in
                self?.dataProduct = responseDataProduct
                self?.dataProductScription?.cancel()
            })
        
    }
}
