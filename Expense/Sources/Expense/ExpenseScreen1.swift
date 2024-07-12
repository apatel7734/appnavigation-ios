//
//  ExpenseScreen1.swift
//
//
//  Created by Ashish Patel on 7/10/24.
//

import SwiftUI
import Common

struct ExpenseScreen1: View {
    @EnvironmentObject var navigation: AppNavigation

    var body: some View {
        Button("To E-Screen2") {
            navigation.path.append(AppDestination.expenseScreen2)
        }
        .navigationTitle("E-Screen1")
    }
}

#Preview {
    ExpenseScreen1()
}
