import SwiftUI

struct MainScreen: View {
    @Environment(\.dismiss) var dismiss
    @Environment(GameModel.self) private var model
    @State private var tasks = [
        "Drink 8 glasses of water",
        "Take a 10-minute walk"
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 1.0, green: 0.85, blue: 0.9),
                    Color(red: 0.9, green: 0.85, blue: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "sparkle")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("POKÉ TASKS")
                            .font(.system(size: 40, weight: .heavy, design: .rounded))
                            .foregroundColor(Color(red: 0.8, green: 0.3, blue: 0.5))
                        Image(systemName: "sparkle")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    Text("✨Complete your daily adventures! ✨")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(Color(red: 0.7, green: 0.4, blue: 0.6))
                }
                .padding(.top, 30)
                .padding(.bottom, 10)
                
                // work on alignment
                HStack() {
                    Text("\(model.tickets)")
                        .font(.system(size: 20, weight: .bold))
                    Image("ticket")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 90, height: 36)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.6))
                        .shadow(color: Color.pink.opacity(0.2), radius: 5, x: 0, y: 2))
                .padding(.trailing, 250)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(tasks, id: \.self) { task in
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 16))
                                Text(task)
                                    .font(.system(size: 17, weight: .medium, design: .rounded))
                                    .foregroundColor(.black)
                                Spacer()
                                ZStack {
                                    Circle()
                                        .fill(Color.white.opacity(0.5))
                                        .frame(width: 30, height: 30)
                                    Button(action: {}) {
                                        Text("✓")
                                            .foregroundColor(.green)
                                            .font(.system(size: 14, weight: .bold))
                                        //remember to add action
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.7))
                                    .shadow(color: Color.pink.opacity(0.2), radius: 5, x: 0, y: 2)
                            )
                            .padding(.horizontal, 16)
                        }
                    }
                    .padding()
                }
                VStack(spacing: 12) {
                    NavigationLink(destination: GachaScreen()) {
                        HStack {
                            Image(systemName: "gift.fill")
                                .font(.headline)
                            Text("Go to Gacha Screen")
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
        MainScreen()
            .environment(GameModel())
    }
}
