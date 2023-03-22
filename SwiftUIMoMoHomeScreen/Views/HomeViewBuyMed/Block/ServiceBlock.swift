//
//  ServiceBlock.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import SwiftUI

struct ServiceBlock: View {

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<4, id: \.self) { _ in
                ServiceBlockItem()
            }
        }
        .padding(.horizontal)
    }
}

struct ServiceBlock_Previews: PreviewProvider {
    static var previews: some View {
        ServiceBlock()
    }
}
