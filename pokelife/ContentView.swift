import SwiftUI

struct ContentView: View {
    @State private var path: [SelectedMenu] = []
    @Environment(GameModel.self) private var model: GameModel
    
    var body: some View {
        NavigationStack(path: $path) {
            StartingScreen(path: $path)
                .navigationDestination(for: SelectedMenu.self) { menu in
                    switch menu {
                    case .start:
                        StartingScreen(path: $path)
                    case .main:
                        MainScreen()
                    case .gacha:
                        GachaScreen()
                    case .collection:
                        CollectionScreen()
                    }
                }
        }
    }
}
#Preview {
      ContentView()
          .environment(GameModel())
  }
