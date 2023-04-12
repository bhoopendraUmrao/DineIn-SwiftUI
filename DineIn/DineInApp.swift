//
//  DineInApp.swift
//  DineIn
//
//  Created by Bhoopendra Umrao on 1/16/23.
//

import SwiftUI

@main
struct DineInApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
