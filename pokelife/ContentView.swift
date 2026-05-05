import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @Environment(GameModel.self) private var model: GameModel
    
    var body: some View {
            TabView(selection: $selectedTab){
                StartingScreen(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Start", systemImage: "house.fill")
                    }
                    .tag(0)
                
                MainScreen(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Tasks", systemImage: "checklist")
                    }
                    .tag(1)
                
                GachaScreen(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Gacha", systemImage: "gift.fill")
                    }
                    .tag(2)
                
                CollectionScreen(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Collection", systemImage: "archivebox.fill")
                    }
                    .tag(3)
            }
        }
    }


#Preview {
      ContentView()
          .environment(GameModel())
          .environment(NetworkClient())
  }
