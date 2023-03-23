//
//  DataServiceApi.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 23/03/2023.
//

import Foundation

class dataServiceApi {
    @Published var dataServices:[ServiceModel] = []
    
    func getDataServiceFromInternal(){
        let url = "/core/config-manager/v1/app-value/single"
        ApiManager.fetchData(urlString: url, type: [ServiceModel].self, method: "GET") { response in
            self.dataServices = response
        } onFail: { error in
            print("data services response error")
        }

        
    }
}
