//
//  DataServiceApi.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 23/03/2023.
//

import Foundation
import Combine

class DataServiceApi {
    @Published var dataServices:ServiceModel? = nil
    
//    private var dataServiceScription: AnyCancellable?
    
//    init(){
//        getDataServiceFromInternal()
//    }
    
//    func getDataServiceFromInternalFollowCombile(){
//        let url = "/core/config-manager/v1/app-value/single"
//        dataServiceScription = ApiManager.fetchData(url: url)
//            .decode(type: ServiceModel.self, decoder: JSONDecoder())
//            .sink(receiveCompletion: ApiManager.handleCompletion, receiveValue: {[weak self] (returnedService) in
//                self?.dataServices = returnedService
//                self?.dataServiceScription?.cancel()
//            })
//
//    }
    
    // MARK: - Call Api with URLSession
    func getDataServiceFromInternal(onCallBack: @escaping (ServiceModel)->Void){
        let url = "/core/config-manager/v1/app-value/single?appCode=972AXHR2"
        ApiManager.fetchData(urlString: url, type: ServiceModel.self, method: "GET") { response in
            onCallBack(response)
        } onFail: { error in
            print("call api data service error")
        }

    }
}
