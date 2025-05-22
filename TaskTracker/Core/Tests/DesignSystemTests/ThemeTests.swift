@testable import DesignSystem
import SwiftUI
import Testing

struct ThemeTests {
  @Test
  func appFontStyleName() {
    #expect(AppFontStyle.title.name == "Baskerville-Bold")
    #expect(AppFontStyle.body.name == "Baskerville-Regular")
  }

  @Test
  func appFontStyleSize() {
    #expect(AppFontStyle.title.size == 20)
    #expect(AppFontStyle.body.size == 16)
  }

  @Test
  func themeFontResolution() {
    let titleFont = Theme.font(for: .title)
    let bodyFont = Theme.font(for: .body)

    // Just checking the font is created without crashing
    #expect(Theme.font(for: .title) == titleFont)
    #expect(Theme.font(for: .body) == bodyFont)
  }
}
