//
//  HomeViewModel.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 23/03/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var dataServices: ServiceModel = ServiceModel(status: "Ok", data: [], message: "oke")
    @Published var dataBanner: BannerModel = BannerModel(status: "", data: [], message: "", isBasic: true, timeExcute: 1, timeFetchAPI: 1)
    @Published var  dataProduct: ProductModel = ProductModel(status: "", data: [], message: "", total: 1)
    
    private let dataServiceApi = DataServiceApi()
    private let getBannerApi = BannerApi()
    private let productApi = ProductApi()
    
    private var cancellabels = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }
    
    
    func addSubscribers(){
        dataServiceApi.$dataServices
            .sink { [weak self] (returnData) in
                if let dataResponse = returnData {
                    self?.dataServices = dataResponse
                }
                
            }
            .store(in: &cancellabels)
        
        getBannerApi.$dataBanner
            .sink { [weak self] (returnData) in
                if let dataBannerResponse = returnData{
                    self?.dataBanner = dataBannerResponse
                }
            }
            .store(in: &cancellabels)
        
        productApi.$dataProduct.sink { [weak self] (returnData) in
            if let dataProductResponse = returnData{
                self?.dataProduct = dataProductResponse
            }
        }
        .store(in: &cancellabels)
        
    }
    
    func getDataServiceFromInternalFromCombine(){
        dataServiceApi.getDataServiceFromInternalFollowCombile()
    }
    
    func getDataBannerHome(){
        getBannerApi.getDataBannerWithCombine()
    }
    
    func getDataProduct(){
        productApi.getDataProductWithCombine()
//        productApi.getDataProductWithURLSession { productData in
//            self.dataProduct = productData
//        }
    }
    
    
//    func getDataServiceFromInternal(){
//        dataServiceApi.getDataServiceFromInternal { response in
//            self.dataServices = response
//        }
//    }
    

}
