import SwiftUI

struct StartingScreen: View {
    @Binding var path: [SelectedMenu]
    
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                Color.red
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 25)
                Color.white
            }
            .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 100)
                Text("PokéLife")
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 16)
                Spacer()
                Button(action: { path.append(.main) }) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .overlay(
                                Circle()
                                    .strokeBorder(Color.black, lineWidth: 5)
                            )
                            .frame(width: 170, height: 170)
                        Text("Start Journey")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.black)
                    }
                }
                .buttonStyle(.plain)
                Spacer()
                    .frame(height: 310)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    StartingScreen(path: .constant([]))
}
