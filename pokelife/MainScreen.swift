import SwiftUI

struct MainScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var tasks = [
            "Drink 8 glasses of water",
            "Take a 10-minute walk"
            ]
    
    var body: some View {
        VStack {
            Text("POKÉ TASKS")
                .font(.largeTitle)
                    ScrollView {
                        VStack {
                            ForEach(tasks, id: \.self) { task in
                                HStack {
                                    Text("⭐")
                                    Text(task)
                                    Spacer()
                                    Button(action: {}) {
                                        Text("✓")
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                    
                    NavigationLink(destination: GachaScreen()) {
                        Text("Go to Gacha Screen")
                    }
                    .padding()
            
                    NavigationLink(destination: CollectionScreen()) {
                        Text("Go to Collection Screen")
                    }
            
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Go Back to Starting Screen")
                    }
            .padding()
        }
        .padding()
        .navigationBarHidden(true)
    }
}

#Preview {
    MainScreen()
}
