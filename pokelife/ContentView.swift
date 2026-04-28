import SwiftUI

struct ContentView: View {
    @State private var path: [SelectedMenu] = []
    @Environment(GameModel.self) private var model: GameModel
    
    var body: some View {
        NavigationStack(path: $path) {
            StartingScreen(onStart: { path.append(.main) })
                .navigationDestination(for: SelectedMenu.self) { menu in
                    switch menu {
                    case .start:
                        StartingScreen(onStart: { path.append(.main) })
                    case .main:
                        MainScreen()
                    case .gacha:
                        GachaScreen()
                    }
                }
        }
    }
}
#Preview {
      ContentView()
          .environment(GameModel())
  }
