//
//  SwiftUIView.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Khanh Nguyen on 09/04/2023.
//

import SwiftUI

struct ImageContainerView: View {
    var image: String = ""
    var body: some View {
        GeometryReader { geometry in
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .border(.blue, width: 2)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
    }
}
