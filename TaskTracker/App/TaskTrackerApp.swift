//
//  TaskTrackerApp.swift
//  TaskTracker
//
//  Created by Oleksandr Karpenko on 20.05.2025.
//

import DesignSystem
import SwiftUI

@main
struct TaskTrackerApp: App {
  init() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor.systemBackground

    appearance.largeTitleTextAttributes = [
      .font: Theme.uiFont(for: .largeTitle),
      .foregroundColor: UIColor.black,
    ]

    appearance.titleTextAttributes = [
      .font: Theme.uiFont(for: .title),
      .foregroundColor: UIColor.systemGray,
    ]

    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
  }

  var body: some Scene {
    WindowGroup {
      RootContainer()
    }
  }
}
