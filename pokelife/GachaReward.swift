
import SwiftUI

struct GachaReward: View {
    @Environment(GameModel.self) private var model: GameModel
    @Environment(NetworkClient.self) private var client: NetworkClient
    @Environment(\.dismiss) private var dismiss
    
    let pokemonID: Int
    @State private var pokemon: Pokemon?
    @State private var pokemonName: String = ""
    @State private var pokemonSprite: URL? = URL(string: "")
    @State private var isLoading = false
    @State private var isRewardDisplayed = true
    
    // FIX SHEET DISMISSAL
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            } else if pokemon != nil {
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 350, height: 450)
                        .clipShape(RoundedRectangle(cornerRadius: 36))
                    VStack {
                        AsyncImage(url: pokemonSprite) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 350, height: 350)
                        .offset(y: -25)
                    }
                    VStack {
                        if isRewardDisplayed {
                            Text("You got \(pokemonName.capitalized)!")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            isRewardDisplayed = false
                            dismiss()
                        }) {
                            Text("Ok")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .padding([.leading, .trailing], 20)
                                .padding([.top, .bottom], 10)
                                .background(Color(red: 0.8, green: 0.3, blue: 0.5))
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder(Color.white.opacity(0.3), lineWidth: 1)
                                )
                        }
                    }
                    .offset(y: 125)
                }
            }
        }
        .task {
            isLoading = true
            pokemon = await client.getPokemonData(id: pokemonID)!
            pokemonName = pokemon!.name
            pokemonSprite = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png")
            isLoading = false
        }
    }
}

#Preview {
    NavigationStack {
        GachaReward(pokemonID: 1)
            .environment(GameModel())
            .environment(NetworkClient())
    }
}

