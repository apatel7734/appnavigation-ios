//
//  Screen2.swift
//  AppNavigationDemo
//
//  Created by Ashish Patel on 7/10/24.
//

import SwiftUI
import Common


/// This is how we start new flow of any screen we need.
/// Notice few things:
/// 1. This is the screen that owns the Navigation with @StateObject
/// 2. This screen is wrapped with NavigationStack {}
/// 3. its passing .environmentObject(navigation) to all its children.
/// 4. Dismiss flow is handled here that can be triggered from any screen.
struct Screen2RootView: View {
    @StateObject private var navigation = AppNavigation()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack(path: $navigation.path) {
            Screen2()
                .registerAppNavigationDestinations(navigation)
                .onReceive(navigation.$dismissFlow, perform: { success in
                    if success {
                        dismiss()
                    }
                })
        }
        .environmentObject(navigation)
    }
}

struct Screen2: View {
    @EnvironmentObject var navigation: AppNavigation
    
    var body: some View {
        VStack {
            Button("To screen3") {
                navigation.path.append(AppDestination.screen3)
            }
        }
        .navigationTitle("Screen2")
    }
}

#Preview {
    Screen2()
}
