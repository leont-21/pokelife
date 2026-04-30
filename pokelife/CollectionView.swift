import SwiftUI

struct CollectionScreen: View {
    @Environment(GameModel.self) private var model: GameModel
    @Environment(\.dismiss) var dismiss
    
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
                VStack(spacing: 12) {
                    NavigationLink(destination: MainScreen()) {
                        HStack {
                            Image(systemName: "gift.fill")
                                .font(.headline)
                            Text("Go to Tasks Screen")
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.purple, Color.blue]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                        )
                        .shadow(color: .blue.opacity(0.4), radius: 5, x: 0, y: 3)
                    }
                    
                    NavigationLink(destination: GachaScreen()) {
                        HStack {
                            Image(systemName: "box.fill")
                                .font(.headline)
                            Text("Go to Gacha Screen")
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue, Color.pink]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                        )
                        .shadow(color: .pink.opacity(0.3), radius: 5, x: 0, y: 3)
                    }
                    
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.headline)
                            Text("Go Back")
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.pink, Color.mint]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                        )
                        .shadow(color: .red.opacity(0.4), radius: 5, x: 0, y: 3)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 30)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CollectionScreen()
        .environment(GameModel())
}
