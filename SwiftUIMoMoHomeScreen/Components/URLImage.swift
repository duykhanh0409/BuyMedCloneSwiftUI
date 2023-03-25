//
//  ImageLoad.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 25/03/2023.
//

import SwiftUI

struct URLImage:View{
    let urlString: String
    let width: Int
    let height: Int
    @State var data: Data?
    
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: CGFloat(width),height:CGFloat(height))
                
        }else{
            Image(systemName: "video")
                .resizable()
                .frame(width:CGFloat(width),height: CGFloat(height))
                .background(.gray)
                .onAppear {
                    fetchData()
                }
            
        }
    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            self.data = data
        }
        task.resume()
    }
}
