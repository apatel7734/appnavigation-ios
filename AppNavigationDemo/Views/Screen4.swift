//
//  Screen4.swift
//  AppNavigationDemo
//
//  Created by Ashish Patel on 7/10/24.
//

import SwiftUI
import Common

/// Notice how new flow is started from here. Whichever screens wants to start new flow just triggers the root of that flow and owns the @State of the .sheet()
/// Also notice how navigation is passed to Expense module by just triggering same way as any other screen.
struct Screen4: View {
    @EnvironmentObject var navigation: AppNavigation
    @State private var showingScreen2Flow = false

    var body: some View {
        VStack(spacing: 16) {
            Button("E-Screen1") {
                navigation.path.append(AppDestination.expenseScreen1)
            }
            
            Button("Dimiss flow") {
                navigation.dismissFlow = true
            }
            
            Button("Start Screen2 Flow") {
                showingScreen2Flow = true
            }
        }
        .navigationTitle("Screen4")
        .sheet(isPresented: $showingScreen2Flow, content: {
            Screen2RootView()
        })
    }
}

#Preview {
    Screen4()
}
