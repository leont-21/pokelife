import SwiftUI

struct MainScreen: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Coming Soon!")
            .font(.largeTitle)
            .padding()
        Button("Go Back to Starting Screen"){
            dismiss()
        }
    }
}

#Preview {
    MainScreen()
}
