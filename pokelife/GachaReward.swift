
import SwiftUI

struct GachaReward: View {
    @Environment(GameModel.self) private var model: GameModel
    @Environment(NetworkClient.self) private var client: NetworkClient
    
    let pokemonID: Int
    @State private var pokemon: Pokemon?
    @State private var pokemonName: String
    @State private var pokemonSprite: String
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            } else if let pokemon = pokemon {
                ZStack {
                    VStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width: 200, height: 200)
                            // .offset(y: -275)
                        Text("You got \(pokemonName)!")
                    }
                }
            }
        }
        .task {
            isLoading = true
            pokemon = await client.getPokemonData(id: pokemonID)!
            pokemonName = pokemon!.name
            pokemonSprite = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png"
            isLoading = false
        }
    }
}
