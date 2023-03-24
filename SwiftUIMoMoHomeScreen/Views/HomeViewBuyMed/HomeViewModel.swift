//
//  HomeViewModel.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 23/03/2023.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var dataServices: ServiceModel = ServiceModel(status: "Ok", data: [], message: "oke")
    
    private let dataServiceApi = DataServiceApi()

    
    func getDataServiceFromInternal(){
        dataServiceApi.getDataServiceFromInternal { response in
            self.dataServices = response
        }
    }
    

}
