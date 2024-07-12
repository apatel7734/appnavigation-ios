// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// TODO: There is still one problem trying to fix  is how to pass models here. May be we could just import `ExpenseModels` to Common. still experimenting...
public enum AppDestination: Hashable {
    // Navan screens
    case screen1, screen2, screen3, screen4
    // Expense screens
    case expenseScreen1, expenseScreen2
}

@MainActor
public class AppNavigation: ObservableObject {
    @Published public var path: NavigationPath = NavigationPath()
    @Published public var dismissFlow = false

    public init() { }
}


