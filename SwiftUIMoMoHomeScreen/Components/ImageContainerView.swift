//
//  SwiftUIView.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Khanh Nguyen on 09/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageContainerView: View {
    var image: String = ""
    var body: some View {
        GeometryReader { geometry in
            AnimatedImage(url: URL(string: image))
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .border(.blue, width: 2)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
    }
}
