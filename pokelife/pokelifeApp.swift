
import SwiftUI
import SwiftData

@main
struct pokelifeApp: App {
    @State private var gameModel = GameModel()
    @State private var networkClient = NetworkClient()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(gameModel)
                .environment(networkClient)
        }
    }
}
