import DesignSystem
import SwiftUI

struct SideMenu: View {
  let avatarImage: Image
  let menuItems: [SideMenuItem]
  var onSelect: (String) -> Void

  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      avatarImage
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 80, height: 80)
        .clipShape(Circle())
        .padding(.top, 150)

      Spacer()

      ScrollView {
        VStack(alignment: .leading, spacing: 16) {
          ForEach(menuItems) { item in
            Button(action: {
              onSelect(item.id)
            }, label: {
              Label(item.title, systemImage: item.systemImage)
                .font(Theme.font(for: .body))
            })
            .accessibilityIdentifier("menu-\(item.title.lowercased())")
          }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
      }
    }
    .padding(.horizontal)
    .background(Color(.systemGroupedBackground))
    .edgesIgnoringSafeArea(.all)
    .frame(maxHeight: .infinity)
  }
}

extension SideMenu {
  static func defaultMenu(onSelect: @escaping (String) -> Void) -> SideMenu {
    .init(
      avatarImage: Image(systemName: "person.circle.fill"),
      menuItems: [
        SideMenuItem(
          id: "open_resources",
          title: "Resources",
          systemImage: "book.fill",
        ),
        SideMenuItem(
          id: "open_help",
          title: "Help",
          systemImage: "questionmark.circle",
        ),
        SideMenuItem(
          id: "open_settings",
          title: "Settings",
          systemImage: "gearshape.fill",
        ),
        SideMenuItem(
          id: "logout",
          title: "Logout",
          systemImage: "arrowshape.turn.up.left",
        ),
      ],
      onSelect: onSelect,
    )
  }
}

#Preview {
  //    RootContainer()
  SideMenu.defaultMenu { id in
    print("Selected menu item: \(id)")
  }
}
