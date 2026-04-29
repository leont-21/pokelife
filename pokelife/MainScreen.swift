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
        NavigationLink(destination: GachaScreen()) {
            HStack{
                Image(systemName: "gift.fill")
                    .font(.headline)
                Text("Go to Gacha Screen")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.black, lineWidth: 3)
            )
        }
                .padding()
                    
<<<<<<< HEAD
                Button(action: {
                    dismiss()
                }) {
                    HStack{
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.headline)
=======
                    NavigationLink(destination: GachaScreen()) {
                        Text("Go to Gacha Screen")
                    }
                    .padding()
            
                    NavigationLink(destination: CollectionScreen()) {
                        Text("Go to Collection Screen")
                    }
            
                    Button(action: {
                        dismiss()
                    }) {
>>>>>>> main
                        Text("Go Back to Starting Screen")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .strokeBorder(Color.black, lineWidth: 3)
                        )
                }
            .padding()
        .navigationBarHidden(true)
    }
}

#Preview {
    MainScreen()
}
