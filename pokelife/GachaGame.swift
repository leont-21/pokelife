
import SwiftUI

struct GachaGame: View {
    @Environment(\.dismiss) var dismiss
    @Environment(GameModel.self) private var model
    
    @State private var angle: Angle = .zero
    
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.85, blue: 0.9)
                .ignoresSafeArea()
            
            VStack {
                ZStack() {
                    Image("gachapon")
                    // WORK ON MAKING KNOB ROTATABLE IF GAME ACTIVATED
                    Image("gachapon_knob")
                        .offset(x: 50, y: 100)
                        .rotationEffect(angle)
                        .gesture(
                            RotateGesture()
                                .onChanged { value in
                                    angle = value.rotation
                                }
                        )
                }
                .scaleEffect(1.5)
            }
        }
    }
}

#Preview {
    NavigationStack {
        GachaGame()
            .environment(GameModel())
    }
}
