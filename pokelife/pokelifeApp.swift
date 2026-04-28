
import SwiftUI

@main
struct pokelifeApp: App {
    @State private var gameModel = GameModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()//model: gameModel)
        }
    }
}
