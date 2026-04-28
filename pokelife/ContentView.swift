
import SwiftUI

struct ContentView: View { // add Model parameter (?)
    @State private var path: [SelectedMenu] = []

        var body: some View {
            NavigationStack(path: $path) {
                StartingScreen(path: $path)
                    .navigationDestination(for: SelectedMenu.self) { menu in
                        switch menu {
                        case .start: StartingScreen(path: $path)
                        case .main: MainScreen()
                        case .gacha: GachaScreen()
                        }
                    }
            }
        }
}
