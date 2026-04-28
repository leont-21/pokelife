import SwiftUI

struct ContentView: View {
    @State private var path: [SelectedMenu] = []
    @Environment(GameModel.self) private var model: GameModel
    
    var body: some View {
        NavigationStack(path: $path) {
            StartingScreen()
                .navigationDestination(for: SelectedMenu.self) { menu in
                    switch menu {
                    case .start:
                        StartingScreen()
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
