import SwiftUI

struct StartingScreen: View {
    @State private var navigateToMain = false
        
    var body: some View {
        NavigationStack {
            VStack {
                Text("PokéLife")
                
                Button("Start Journey") {
                    navigateToMain = true
                }
            }
            .fullScreenCover(isPresented: $navigateToMain) {
                MainScreen()
            }
        }
    }
}

#Preview {
    StartingScreen()
}
