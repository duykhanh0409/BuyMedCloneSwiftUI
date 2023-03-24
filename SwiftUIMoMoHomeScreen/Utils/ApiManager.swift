//
//  ApiManager.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 23/03/2023.
//

import Foundation


class ApiManager {
    
    static func fetchData <T:Codable> (urlString: String, type: T.Type, method: String, onSuccess: @escaping (T)->Void, onFail: @escaping(String) -> Void) {
    
        guard let url = URL(string: Config.baseUrl + urlString) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("Basic \(Config.baseToken)", forHTTPHeaderField: "Authorization")
    
    
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
    
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    return
                }
                // get status
                let response = response as! HTTPURLResponse
                let status = response.statusCode
                
                do{
                    let decoder = JSONDecoder()
                    let dataResponse = try decoder.decode(T.self, from: data)
                    onSuccess(dataResponse)
                }catch {
                    print("call data error", error.localizedDescription )
                    onFail(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}


//po try? JSONDecoder().decode([CoinModel].self, from: output.data)
