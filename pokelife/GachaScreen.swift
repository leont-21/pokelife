import SwiftUI

struct GachaScreen: View {
    @Binding var selectedTab: Int
    @Environment(GameModel.self) private var model
    @State private var showingGachaGame = false
    
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
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                }
                .padding(.top, 25)
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
                 
                    Image("gachapon_knob")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 100, maxHeight: 100)
                        .offset(x: 60, y: 125)
                }
                Button(action: {
                    if model.tickets >= 1 {
                        model.spendTicket()
                        showingGachaGame = true
                    }
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
                .disabled(model.tickets < 1)
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showingGachaGame) {
                    GachaGame()
                        .environment(model)
                        .environment(NetworkClient())
                }
    }
}

#Preview {
    NavigationStack {
        GachaScreen(selectedTab: .constant(2))
            .environment(GameModel())
    }
}
