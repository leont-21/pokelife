import SwiftUI

struct MainScreen: View {
    @Binding var selectedTab: Int
    @Environment(GameModel.self) private var model
    @State private var tasks = [
        "Drink a glass of water",
        "Take a 10-minute walk",
        "Stretch for a minute",
        "Do a breathing exercise for 3 minutes",
        "Complement someone",
        "Clean something",
        "Write about your day",
        "Write how you're feeling now",
        "Spend 30 minutes being productive, undistracted"
    ]
    @State private var currTasks: [String] = []
    private let maxTasks = 3
    
    func generateCurrTasks() {
        while (currTasks.count < maxTasks) {
            var randTask = tasks[Int.random(in: 0..<tasks.count)]
            while currTasks.contains(randTask) {
                randTask = tasks[Int.random(in: 0..<tasks.count)]
            }
            currTasks.append(randTask)
            print(currTasks)
        }
    }
    
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
                        ForEach(currTasks, id: \.self) { task in
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
                                            .onTapGesture {
                                                //Add Tickets
                                                model.addTickets(amt: 1)
                                                //Remove Task
                                                currTasks.remove(at: currTasks.firstIndex(of: task) ?? -1)
                                                //Generate New Task into currTasks
                                                generateCurrTasks()
                                            }
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
                        }
                    }
                    .padding()
                    .onAppear {
                        generateCurrTasks()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    NavigationStack {
        MainScreen(selectedTab: .constant(1))
            .environment(GameModel())
    }
}
