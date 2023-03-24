//
//  HomeViewModel.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 23/03/2023.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var dataServices: ServiceModel = ServiceModel(status: "Ok", data: [], message: "oke")
    
//    private let dataBlockService:DataServiceApi

    
    func getDataServiceFromInternal(){
        let url = "/core/config-manager/v1/app-value/single?appCode=972AXHR2"
        ApiManager.fetchData(urlString: url, type: ServiceModel.self, method: "GET") { response in
            self.dataServices = response
        } onFail: { error in
            print("call api data service error")
        }

    }
    

}
