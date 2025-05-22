import SwiftUI
@testable import TaskTracker
import Testing

@Suite
struct SideMenuItemTests {
  @Test("Items with same ID are equal")
  func equality_sameID() {
    let a = SideMenuItem(id: "item1", title: "Home", systemImage: "house")
    let b = SideMenuItem(id: "item1", title: "Other", systemImage: "gear") // Different fields, same id

    #expect(a == b)
  }

  @Test("Items with different ID are not equal")
  func equality_differentID() {
    let a = SideMenuItem(id: "item1", title: "Home", systemImage: "house")
    let b = SideMenuItem(id: "item2", title: "Home", systemImage: "house")

    #expect(a != b)
  }

  @Test("Correct fields are retained")
  func fields() {
    let item = SideMenuItem(id: "logout", title: "Logout", systemImage: "arrow.left")

    #expect(item.id == "logout")
    #expect(item.title == "Logout")
    #expect(item.systemImage == "arrow.left")
  }

  @Test("Can be used in Identifiable collections")
  func identifiableConformance() {
    let items = [
      SideMenuItem(id: "a", title: "A", systemImage: "a.circle"),
      SideMenuItem(id: "b", title: "B", systemImage: "b.circle"),
    ]

    let ids = items.map(\.id)
    #expect(ids == ["a", "b"])
  }
}
