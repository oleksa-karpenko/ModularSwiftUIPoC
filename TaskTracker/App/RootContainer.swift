import SwiftUI

struct RootContainer: View {
  @State public var isMenuOpen = false

  var body: some View {
    ZStack(alignment: .leading) {
      ContentView()
        .disabled(isMenuOpen)
        .blur(radius: isMenuOpen ? 3 : 0)

      if isMenuOpen {
        // Background tap detector
        Color.black.opacity(0.001) // Invisible, but catches taps
          .ignoresSafeArea()
          .onTapGesture { isMenuOpen = false }

        SideMenu.defaultMenu(onSelect: { _ in isMenuOpen = false })
          .frame(width: 180)
          .transition(.move(edge: .leading))
          .zIndex(1)
      }
    }
    .animation(.easeInOut, value: isMenuOpen)
    .toolbarBackground(.hidden, for: .navigationBar)
    .overlay(alignment: .topLeading) {
      Button(action: {
        isMenuOpen.toggle()
      }, label: {
        Image(systemName: "line.horizontal.3")
          .imageScale(.large)
          .padding()
      })
    }
  }
}

#Preview {
  RootContainer()
}
