//
//  Screen3.swift
//  AppNavigationDemo
//
//  Created by Ashish Patel on 7/10/24.
//

import SwiftUI
import Common

struct Screen3: View {
    @EnvironmentObject var navigation: AppNavigation

    var body: some View {
        VStack {
            Button("To screen4") {
                navigation.path.append(AppDestination.screen4)
            }
        }
        .navigationTitle("Screen3")
    }
}

#Preview {
    Screen3()
}
