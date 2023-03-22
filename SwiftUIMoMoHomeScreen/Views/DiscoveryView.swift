//
//  DiscoveryView.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 22/03/2023.
//

import SwiftUI

struct DiscoveryView: View {
    var body: some View {
        NavigationView {
           Text("TabView 1")
               .navigationBarTitle("Dashboard")
               .navigationBarItems(trailing:
                   HStack {
                       Button(action: {
                           // more code here
                       }) {
                           Image(systemName: "arrow.clockwise")
                               .font(.title)
                       }
                       Button(action: {
                           // more code here
                       }) {
                           Image(systemName: "slider.horizontal.3")
                               .font(.title)
                       }
                   }
               )
       }
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
