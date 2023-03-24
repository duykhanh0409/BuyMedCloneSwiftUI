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
    
    private let dataServiceApi = DataServiceApi()
    private var cancellabels = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }
    
    func getDataServiceFromInternal(){
        dataServiceApi.getDataServiceFromInternal { response in
            self.dataServices = response
        }
    }
    
    func addSubscribers(){
        dataServiceApi.$dataServices
            .sink { [weak self] (returnData) in
                if let dataResponse = returnData {
                    self?.dataServices = dataResponse
                }
                
            }
            .store(in: &cancellabels)
    }
    
    func getDataServiceFromInternalFromCombine(){
        dataServiceApi.getDataServiceFromInternalFollowCombile()
    }
    
    
    
    

}
