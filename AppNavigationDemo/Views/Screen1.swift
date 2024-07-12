//
//  Screen1.swift
//  AppNavigationDemo
//
//  Created by Ashish Patel on 7/10/24.
//

import SwiftUI
import Common

/// Notice how none of the screen is wrapped within NavigationStack{}, its assumed that it will be wrapped by a root. Also Root will provide access to navigation object.
struct Screen1: View {
    @EnvironmentObject var navigation: AppNavigation

    var body: some View {
        VStack {
            Button("To screen2") {
                navigation.path.append(AppDestination.screen2)
            }
            .navigationTitle("Screen1")
        }
    }
}

#Preview {
    Screen1()
}

