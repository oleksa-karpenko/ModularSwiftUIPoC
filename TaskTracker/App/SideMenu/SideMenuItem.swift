import Foundation

struct SideMenuItem: Identifiable, Equatable {
  static func == (lhs: SideMenuItem, rhs: SideMenuItem) -> Bool {
    lhs.id == rhs.id
  }

  let id: String
  let title: String
  let systemImage: String
}
