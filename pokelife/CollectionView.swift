
import SwiftUI

struct CollectionScreen: View {
    @Environment(GameModel.self) private var model: GameModel

    
    var body: some View {
    
    }
}

#Preview {
    CollectionScreen()
        .environment(GameModel())
}
