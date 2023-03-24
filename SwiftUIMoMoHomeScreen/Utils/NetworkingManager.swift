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
        case BadURLResponse(url: URLRequest)
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
    
    static func fetchData(url:String, method: String) -> Publishers.ReceiveOn<Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher,DispatchQueue>, Data>, DispatchQueue>{
        let urlString = URL(string: Config.baseUrl + url)
        var urlRequest = URLRequest(url: urlString!)
          urlRequest.httpMethod = method
        
        urlRequest.setValue("Basic \(Config.baseToken)",
                              forHTTPHeaderField: "Authorization")
        // chổ này chưa biết unwrap cái URL sao nên đang để force safety un
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .subscribe(on: DispatchQueue.global(qos: .default))
                .tryMap { try handleUrlResponse(output: $0,url: urlRequest )}
                .receive(on: DispatchQueue.main)
    }

    static func handleUrlResponse(output: URLSession.DataTaskPublisher.Output, url: URLRequest) throws -> Data{
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




