//
//  ServiceBlock.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import SwiftUI

struct ServiceBlock: View {
    let listService: ServiceModel
    var body: some View {
        HStack(spacing: 10) {
                ForEach(listService.data, id: \.appValueCode) { service in
                    ServiceBlockItem(service: service)
                }

        }
        .padding(.horizontal)
    }
}

//struct ServiceBlock_Previews: PreviewProvider {
//    static var previews: some View {
//        ServiceBlock()
//    }
//}
