//
//  HomeViewModel.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 23/03/2023.
//

import Foundation

class HomeViewModel:ObservableObject {
    @Published var dataServices: ServiceModel
    private let dataServiceApi = dataServiceApi()
    init() {
        dataServiceApi.getDataServiceFromInternal()
    }
    
}
