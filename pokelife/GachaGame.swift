
import SwiftUI

struct GachaGame: View {
    @Environment(GameModel.self) private var model
    @State private var rotation: Angle = .zero
    
    var body: some View {
        ZStack {
            // ADD BARS TO TOP & BOTTOM FOR VISUAL EFFECT
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 250, height: 50)
            Color(red: 1.0, green: 0.85, blue: 0.9)
                .ignoresSafeArea()
            ZStack() {
                Image("gachapon")
                // MAKE IT SO knob is rotatable about its center after gacha initiation
                VStack {
                    Image("gachapon_knob")
                        .rotationEffect(rotation, anchor: .center)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    self.rotation = rotateKnob(position: value)
                                }
                        )
                }
                .offset(x: 50, y: 100)
            }
            .scaleEffect(1.5)
        }
    }
    
    // calculates angle relative to the center
    func rotateKnob(position: DragGesture.Value) -> Angle {
        let vector = CGVector(dx: position.location.x - 50, dy: position.location.y - 110)
        let radians = atan2(vector.dy, vector.dx)
        return Angle(radians: Double(radians))
    }
}

#Preview {
    NavigationStack {
        GachaGame()
            .environment(GameModel())
    }
}
