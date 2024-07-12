//
//  AppNavigation.swift
//  AppNavigationDemo
//
//  Created by Ashish Patel on 7/10/24.
//

import SwiftUI
import Common
import Expense

/// The reason this is kept here is so we don't need to import any modules to Common. Common will be imported to all other modules.  Only enum AppDestination is kept in Common to have access across modules.
struct AppNavigationViewModifier: ViewModifier {
    @ObservedObject var navigation: AppNavigation

    init(navigation: AppNavigation) {
        self.navigation = navigation
    }

    func body(content: Content) -> some View {
        content
            .navigationDestination(for: AppDestination.self) { dest in
                switch dest {
                case .screen1:
                    Screen1()
                case .screen2:
                    Screen2()
                case .screen3:
                    Screen3()
                case .screen4:
                    Screen4()
                case .expenseScreen1:
                    ExpenseApp.screen1
                case .expenseScreen2:
                    ExpenseApp.screen2
                }
            }
    }
}
extension View {
    func registerAppNavigationDestinations(_ navigation: AppNavigation) -> some View {
        modifier(AppNavigationViewModifier(navigation: navigation))
    }
}

extension NavigationStack {
    init(navigation: ObservedObject<AppNavigation>, @ViewBuilder root: () -> Root) where Data == NavigationPath {
        self.init(path: navigation.projectedValue.path, root: root)
    }
}

struct AppNavigationStack: ViewModifier {
    @ObservedObject var navigation: AppNavigation

    init(navigation: AppNavigation) {
        self.navigation = navigation
    }

    func body(content: Content) -> some View {
        NavigationStack(path: $navigation.path) {
            content
                .registerAppNavigationDestinations(navigation)
        }
    }
}

