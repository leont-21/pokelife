import SwiftUI

struct GachaScreen: View {
    @Environment(\.dismiss) var dismiss
    @Environment(GameModel.self) private var model
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 1.0, green: 0.85, blue: 0.9),
                Color(red: 0.9, green: 0.85, blue: 1.0)
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "gift.fill")
                            .foregroundColor(.pink)
                            .font(.title)
                        Text("Gacha Screen")
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                            .foregroundColor(Color(red: 0.8, green: 0.3, blue: 0.5))
                        Image(systemName: "gift.fill")
                            .foregroundColor(.pink)
                            .font(.title)
                    }
                    Text("✨ Spin to get new Pokémon! ✨")
                }
                .padding(.top, 50)
                .padding(.bottom, 10)
                
                HStack() {
                    Text("\(model.tickets)")
                        .font(.system(size: 28, weight: .bold))
                    Image("ticket")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 100, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.6))
                        .shadow(color: Color.pink.opacity(0.2), radius: 5, x: 0, y: 2))
                .padding(.trailing, 275)
                
                ZStack() {
                    Image("gachapon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 250, maxHeight: 250)
                    Image("gachapon_knob")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50, maxHeight: 50)
                        .offset(x: 27, y: 65)
                }
                
                // make this initiate a "gacha game"
                Button(action: {
                    
                }) {
                    Text("Spin for [ 1 ] ticket")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0.8, green: 0.3, blue: 0.5))
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                        )
                }
                //same code as in mainscreen with some differences
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
                    
                    NavigationLink(destination: CollectionScreen()) {
                        HStack {
                            Image(systemName: "box.fill")
                                .font(.headline)
                            Text("Go to Collection Screen")
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
    NavigationStack {
        GachaScreen()
            .environment(GameModel())
    }
}
