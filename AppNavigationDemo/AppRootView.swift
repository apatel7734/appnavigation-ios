//
//  AppRootView.swift
//  AppNavigationDemo
//
//  Created by Ashish Patel on 7/10/24.
//

import SwiftUI
import Common

struct AppRootView: View {
    @StateObject var navigation = AppNavigation()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack(path: $navigation.path) {
            VStack {
                Button("To screen1") {
                    navigation.path.append(AppDestination.screen1)
                }
            }
            .registerAppNavigationDestinations(navigation)
            .navigationTitle("Home")
            .onReceive(navigation.$dismissFlow) { success in
                if success {
                    navigation.path.removeLast(navigation.path.count)
                }
            }
            .padding()
        }
        .environmentObject(navigation)
    }
}

#Preview {
    AppRootView()
}
