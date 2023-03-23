//
//  ApiService.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import Foundation
import Combine

class NetworkingManager{
    
    enum NetworkingError: LocalizedError {
        case BadURLResponse(url: URL)
        case unknow
        
        var errorDescription: String? {
            switch self {
            case .BadURLResponse(url: let url) :
                return "bad response from url: \(url)"
            case .unknow:
                return "unknow error occured"
            }
        }
    }
    
//    static func fetchData(url:String) -> Publishers.ReceiveOn<Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher,DispatchQueue>, Data>, DispatchQueue>{
//        guard let urlString = URL(string: Config.baseUrl + url) else {
//            print("Url have issue")
//            return
//        }
//        return URLSession.shared.dataTaskPublisher(for: urlString)
//                .subscribe(on: DispatchQueue.global(qos: .default))
//                .tryMap { try handleUrlResponse(output: $0,url:urlString )}
//                .receive(on: DispatchQueue.main)
//    }
//
    static func handleUrlResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else{
            throw NetworkingError.BadURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print("khanh error"+error.localizedDescription)
        }
    }
    
   
}




