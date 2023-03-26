//
//  ApiManager.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 23/03/2023.
//

import Foundation


class ApiManager {
    
    static func fetchData <T:Codable> (urlString: String, type: T.Type, method: String,
                                       querys: [String:Any] = [:],isBasic:Bool = false, onSuccess: @escaping (T)->Void, onFail: @escaping(String) -> Void) {
    
        guard let url = URL(string: Config.baseUrl + urlString) else {return}
        var request = URLRequest(url: url)
        if method == "POST" {
            print("khanh parse querys", querys)
            let requestBody = try? JSONSerialization.data(withJSONObject: querys, options: [])
            print("khanh querys", requestBody)
            request.httpBody = requestBody
        }
        
       
        request.httpMethod = method
        request.setValue("\(isBasic ? Config.baseToken : Config.bearerToken)",
                              forHTTPHeaderField: "Authorization")
     
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    
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
