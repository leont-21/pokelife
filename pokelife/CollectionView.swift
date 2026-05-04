import SwiftUI

struct CollectionScreen: View {
    @Binding var selectedTab: Int
    @Environment(GameModel.self) private var model: GameModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 1.0, green: 0.85, blue: 0.9),
                Color(red: 0.9, green: 0.85, blue: 1.0)
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack{
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                            .font(.title)
                        Text("Collection Screen")
                            .font(.system(size: 35, weight: .heavy, design: .rounded))
                            .foregroundColor(Color(red: 0.8, green: 0.3, blue: 0.5))
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                            .font(.title)
                    }
                    Text("✨ Here are your Pokemon! ✨")
                }
                .padding(.top, 30)
                .padding(.bottom, 20)
                
                Spacer()
                // Pokemon list made with a lazy grid
                VStack(spacing: 20) {
                    Image(systemName: "sparkles")
                        .font(.system(size: 80))
                        .foregroundColor(.purple)
                        .padding()
                        .background(
                            Circle()
                                .fill(Color.white.opacity(0.7))
                                .frame(width: 150, height: 150)
                        )
                    Text("Collection Coming Soon!")
                    Text("Collect all the cute Pokémon!")
                }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    CollectionScreen(selectedTab: .constant(3))
        .environment(GameModel())
}
