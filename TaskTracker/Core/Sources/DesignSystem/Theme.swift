import SwiftUI

private enum AppFont: String {
  case avenirNext = "AvenirNext"
  case hack
  case baskerville = "Baskerville"

  static let `default`: AppFont = .baskerville
}

public enum AppFontStyle {
  case largeTitle
  case title
  case body

  var name: String {
    switch self {
    case .largeTitle: return "\(AppFont.default.rawValue)-Bold"
    case .title: return "\(AppFont.default.rawValue)-Bold"
    case .body: return "\(AppFont.default.rawValue)-Regular"
    }
  }

  var size: CGFloat {
    switch self {
    case .largeTitle: return 34
    case .title: return 20
    case .body: return 16
    }
  }

  var font: Font {
    .custom(name, size: size)
  }
}

public enum Theme {
  public static func font(for style: AppFontStyle) -> Font {
    style.font
  }

  public static func uiFont(for style: AppFontStyle) -> UIFont {
    return UIFont(name: style.name, size: style.size)!
  }
}
