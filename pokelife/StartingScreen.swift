import SwiftUI

struct StartingScreen: View {
    @State private var navigateToMain = false
        
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [Color.red, Color.white]),
                    startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                VStack(spacing: 100) {
                    Text("PokéLife")
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Button("Start Journey") {
                        navigateToMain = true
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(
                        Circle()
                            .fill(Color.white)
                            .overlay(
                                Circle()
                                    .strokeBorder(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.red, Color.white]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        ),
                                        lineWidth: 2
                                    )
                            )
                            .frame(width: 170, height: 170)
                    )
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    StartingScreen()
}
