import SwiftUI

struct CollectionScreen: View {
    @Binding var selectedTab: Int
    @Environment(GameModel.self) private var model: GameModel
    @Environment(NetworkClient.self) private var client: NetworkClient

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 1.0, green: 0.85, blue: 0.9),
                Color(red: 0.9, green: 0.85, blue: 1.0)
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack{
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                            .font(.title)
                        Text("Collection Screen")
                            .font(.system(size: 35, weight: .heavy, design: .rounded))
                            .foregroundColor(Color(red: 0.8, green: 0.3, blue: 0.5))
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                            .font(.title)
                    }
                    Text("✨ Here are your Pokemon! ✨")
                }
                .padding(.top, 30)
                .padding(.bottom, 20)
                
                Spacer()
                // Pokemon list made with a lazy grid
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
    //                    Image(systemName: "sparkles")
    //                        .font(.system(size: 80))
    //                        .foregroundColor(.purple)
    //                        .padding()
    //                        .background(
    //                            Circle()
    //                                .fill(Color.white.opacity(0.7))
    //                                .frame(width: 150, height: 150)
    //                        )
    //                    Text("Collection Coming Soon!")
    //                    Text("Collect all the cute Pokémon!")
                        //loop through all pokemon list to get views for all pokemon
                        ForEach(client.allPokemon, id: \.self) { pokemon in
                            PokemonView(pokemon: pokemon ?? Pokemon(id: 681, sprite_path: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/681.png", frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/681.png", backDefault: "", backShiny: ""), name: "aegislash shield", shiny: false), collected: model.collectedPokemon[pokemon?.id ?? 0] ?? false)
                        }
                    }
                }
                Spacer()
            }
            //task to get all pokemon
            .task {
                for id in 1...1025{
                    if(model.collectedPokemon[id] == nil){
                        //populate all_pokemon_array in client
                        await client.populateOneAllPokemon(id: id)
                        //add pokemon id to collected dictionary in model
                        model.addIDtoCollectedPokemon(id: id)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    CollectionScreen(selectedTab: .constant(3))
        .environment(GameModel())
        .environment(NetworkClient())
}
