import SwiftUI

struct MainScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var tasks = [
        "Drink 8 glasses of water",
        "Take a 10-minute walk"
    ]
    
    var body: some View {
        VStack (spacing: 8){
            Text("POKÉ TASKS")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .shadow(color: .red, radius: 9, x: 0, y: 2)
            Text("✨Complete your daily training! ✨")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1, x: 0, y: 1)
        }
        ScrollView {
            VStack {
                ForEach(tasks, id: \.self) { task in
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 22))
                        Text(task)
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .foregroundColor(.black)
                        Spacer()
                        Button(action: {}) {
                            Text("✓")
                            //add action here
                        }
                    }
                    .padding()
                }
            }
        }
        VStack(spacing: 12) {
            NavigationLink(destination: GachaScreen()) {
                HStack {
                    Image(systemName: "gift.fill")
                        .font(.headline)
                    Text("Go to Gacha Screen")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                    LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15)
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
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.pink]),
                                         startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                        )
                        .shadow(color: .pink.opacity(0.4), radius: 5, x: 0, y: 3)
                    }
                    
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.headline)
                            Text("Go to Starting Screen")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.mint]),
                                         startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                        )
                        .shadow(color: .red.opacity(0.4), radius: 5, x: 0, y: 3)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                
                .navigationBarHidden(true)
            }
        }


#Preview {
    MainScreen()
}
