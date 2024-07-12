//
//  ExpenseScreen2.swift
//
//
//  Created by Ashish Patel on 7/10/24.
//

import SwiftUI
import Common

struct ExpenseScreen2: View {
    @EnvironmentObject var navigation: AppNavigation

    var body: some View {
        Button("dismissFlow") {
            navigation.dismissFlow = true
        }
        .navigationTitle("E-Screen2")
    }
}

#Preview {
    ExpenseScreen2()
}
