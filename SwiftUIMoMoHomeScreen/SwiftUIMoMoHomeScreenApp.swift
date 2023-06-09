//
//  SwiftUIMoMoHomeScreenApp.swift
//  SwiftUIMoMoHomeScreen
//
//  Created by Thuocsi on 04/03/2023.
//

import SwiftUI

@main
struct SwiftUIMoMoHomeScreenApp: App {
    @StateObject private var vm = HomeViewModel()
   
    var body: some Scene {
        WindowGroup {
           ContentView()
                .environmentObject(vm)
        }
    }
}
