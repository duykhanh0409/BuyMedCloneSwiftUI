//
//  GetBannerApi.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 24/03/2023.
//

import Foundation
import Combine

class BannerApi {
    @Published var dataBanner:BannerModel? = nil
    
    private var dataBannerScription: AnyCancellable?
    
    func getDataBannerWithCombine() {
        let url = "/api/web/banner"
        dataBannerScription = NetworkingManager.fetchDataWithDomainWeb(url: url, method: "GET")
            .decode(type: BannerModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (responseBanner) in
                self?.dataBanner = responseBanner
                self?.dataBannerScription?.cancel()
            })
        
    }
}
