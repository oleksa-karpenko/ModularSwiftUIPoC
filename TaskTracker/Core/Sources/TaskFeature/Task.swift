import Foundation

public struct Task: Identifiable, Equatable {
  public let id: UUID
  public var title: String
  public var details: String
  public var isCompleted: Bool

  public init(
    id: UUID = UUID(),
    title: String,
    details: String = "",
    isCompleted: Bool = false
  ) {
    self.id = id
    self.title = title
    self.details = details
    self.isCompleted = isCompleted
  }
}
