
import SwiftUI

struct GachaGame: View {
    @Environment(GameModel.self) private var model
    
    // knob turning for gacha!
    @State private var gachaOn = false
    @State private var rotation: Angle = .zero
    @State private var arrowVis = true
    @State private var totalRotation: Int = 0
    
    var body: some View {
        ZStack {
            // ADD BARS TO TOP & BOTTOM FOR VISUAL EFFECT
            Color(red: 1.0, green: 0.85, blue: 0.9)
                .ignoresSafeArea()
            ZStack() {
                Rectangle()
                    .foregroundColor(.brown)
                    .frame(width: 300, height: 105)
                    .offset(y: -275)
                
                Image("gachapon")
                
                if !gachaOn {
                    Image("arrow")
                        .opacity(arrowVis ? 1 : 0.7)
                        .animation (
                            .easeInOut(duration: 0.4)
                            .repeatForever(autoreverses: true),
                            value: arrowVis
                        )
                        .onAppear {
                            arrowVis = false
                        }
                        .scaleEffect(0.20)
                        .offset(x: 7, y: 57)
                        .rotationEffect(.degrees(-26))
                }
                
                VStack {
                    Image("gachapon_knob")
                        .rotationEffect(rotation, anchor: .center)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    gachaOn = true
                                        self.rotation = rotateKnob(position: value)
                                }
                        )
                }
                .offset(x: 50, y: 100)
                
                Rectangle()
                    .foregroundColor(.brown)
                    .frame(width: 300, height: 80)
                    .offset(y: 250)
            }
            .scaleEffect(1.5)
        }
    }
    
    // calculates angle relative to the center
    func rotateKnob(position: DragGesture.Value) -> Angle {
        let vector = CGVector(dx: position.location.x - 50, dy: position.location.y - 110)
        let radians = atan2(vector.dy, vector.dx)
        let newAngle = Angle(radians: Double(radians))
        var delta = newAngle.degrees - rotation.degrees
        
        if delta <= -180 { delta += 360 }
        if delta > 180 { delta -= 360 }
        
        // check if movement is clockwise
        if delta > 0 {
            if totalRotation < 1080 {
                totalRotation += Int(delta)
                
                if totalRotation >= 1080 {
                    // give the player a pokemon!!
                }
            }
            return newAngle
        } else {
            // go back to previous position if countercw
            return rotation
        }
    }
}

#Preview {
    NavigationStack {
        GachaGame()
            .environment(GameModel())
    }
}
