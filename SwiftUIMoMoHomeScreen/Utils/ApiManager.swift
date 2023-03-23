//
//  ApiService.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import Foundation
import Combine

class ApiManager{
    
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
    
    static func fetchData(url: URL) -> Publishers.ReceiveOn<Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher,DispatchQueue>, Data>, DispatchQueue>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap(try handleUrlResponse(output: $0, url: <#T##URL#>))
            .receive(on: DispatchQueue.main)
    }
    
    static func handleUrlResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else{
            throw NetworkingError.BadURLResponse(url: url)
        }
        return output.data
    }
    
    
   
}




//static func fetchData <T:Codable> (urlString: String, type: T.Type, method: String, onSuccess: @escaping (T)->Void, onFail: @escaping(String) -> Void) {
//
//    guard let url = URL(string: Config.baseUrl + urlString) else {return}
//
//    var request = URLRequest(url: url)
//    request.httpMethod = method
//
//
//    let task = URLSession.shared.dataTask(with: request) { data, _, error in
//
//        guard let data = data, error == nil else {
//            return
//        }
//
//        do{
//            let decoder = JSONDecoder()
//            let dataResponse = try decoder.decode(T.self, from: data)
//            onSuccess(dataResponse)
//        }catch {
//            onFail(error.localizedDescription)
//        }
//    }
//}
