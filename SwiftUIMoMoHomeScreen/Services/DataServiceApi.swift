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
    
    private var dataServiceScription: AnyCancellable?
    
//    init(){
//        getDataServiceFromInternal()
//    }
    // MARK: - Call Api with Combine
    func getDataServiceFromInternalFollowCombile(){
        let url = "/core/config-manager/v1/app-value/single?appCode=972AXHR2"
        dataServiceScription = NetworkingManager.fetchData(url: url,method: "GET", isQuery: false, querys: [:], isBasic: true)
            .decode(type: ServiceModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnedService) in
                self?.dataServices = returnedService
                self?.dataServiceScription?.cancel()
            })

    }
    
    // MARK: - Call Api with URLSession
    func getDataServiceFromInternal(onCallBack: @escaping (ServiceModel)->Void){
        let url = "/core/config-manager/v1/app-value/single?appCode=972AXHR2"
        ApiManager.fetchData(urlString: url, type: ServiceModel.self, method: "GET", isBasic: true) { response in
            onCallBack(response)
        } onFail: { error in
            print("call api data service error")
        }

    }
}
