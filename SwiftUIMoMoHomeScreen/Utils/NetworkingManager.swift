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
    
    static func fetchData(url:String, method: String, isQuery: Bool, querys: [String:Any], isBasic: Bool = false) -> Publishers.ReceiveOn<Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher,DispatchQueue>, Data>, DispatchQueue>{
        var urlString = URL(string: Config.baseUrl + url )
        var urlRequest = URLRequest(url: urlString!)
        if isQuery == true && querys["key"] != nil  {
            let urlComp = NSURLComponents(string: Config.baseUrl + url)!

               var items = [URLQueryItem]()

               for (key,value) in querys {
                   items.append(URLQueryItem(name: key, value: value as? String))
               }

               items = items.filter{!$0.name.isEmpty}

               if !items.isEmpty {
                 urlComp.queryItems = items
               }
            urlRequest = URLRequest(url: urlComp.url!)
        }
        
        if method == "POST" {
            print("khanh parse querys", querys)
            let requestBody = try? JSONSerialization.data(withJSONObject: querys, options: [])
            print("khanh querys", requestBody)
            urlRequest.httpBody = requestBody
        }
        
        urlRequest.httpMethod = method
        urlRequest.setValue("\(isBasic ? Config.baseToken : Config.bearerToken)",
                              forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // chổ này chưa biết unwrap cái URL sao nên đang để force safety un
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .subscribe(on: DispatchQueue.global(qos: .default))
                .tryMap { try handleUrlResponse(output: $0,url: urlRequest )}
                .receive(on: DispatchQueue.main)
    }
    static func fetchDataWithDomainWeb(url:String, method: String) -> Publishers.ReceiveOn<Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher,DispatchQueue>, Data>, DispatchQueue>{
        let urlString = URL(string: Config.baseUrlWeb + url)
        var urlRequest = URLRequest(url: urlString!)
          urlRequest.httpMethod = method
        
        urlRequest.setValue("Basic \(Config.baseToken)",
                              forHTTPHeaderField: "Authorization")
       
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .subscribe(on: DispatchQueue.global(qos: .default))
                .tryMap { try handleUrlResponse(output: $0,url: urlRequest )}
                .receive(on: DispatchQueue.main)
    }

    static func handleUrlResponse(output: URLSession.DataTaskPublisher.Output, url: URLRequest) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else{
            print("khanh response with \(url) ", (output.response as? HTTPURLResponse)?.statusCode)
            throw NetworkingError.BadURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print("khanh error" + error.localizedDescription)
        }
    }
    
   
}




