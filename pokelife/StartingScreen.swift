import SwiftUI

struct StartingScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "play")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
