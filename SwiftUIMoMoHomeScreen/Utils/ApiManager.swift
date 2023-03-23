//
//  ApiService.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import Foundation

class ApiManager{
    static func fetchData <T:Codable> (urlString: String, type: T.Type, method: String, onSuccess: @escaping (T)->Void, onFail: @escaping(String) -> Void) {
        
        guard let url = URL(string: Config.baseUrl + urlString) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let dataResponse = try decoder.decode(T.self, from: data)
                onSuccess(dataResponse)
            }catch {
                onFail(error.localizedDescription)
            }
        }
    }
}
