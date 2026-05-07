import SwiftUI

struct CollectionScreen: View {
    @Binding var selectedTab: Int
    @Environment(GameModel.self) private var model: GameModel
    @Environment(NetworkClient.self) private var client: NetworkClient

    @State private var searchText = ""
    @FocusState private var searchIsActive : Bool
    
    let defaultPokemon = Pokemon(id: 681, sprite_path: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/681.png", frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/681.png", backDefault: "", backShiny: ""), name: "aegislash shield", shiny: false)
    
    var body: some View {
        //navigation stack to make it searchable
        NavigationStack {
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
                    }
                    .padding(.top, 30)
                    
                    //search bar
                    TextField("Search for a pokemon", text: $searchText)
                    .focused($searchIsActive)
                    .textFieldStyle(.roundedBorder)
                    .padding([.bottom, .leading, .trailing], 6)
        

                    
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
                            
                            // IF SEARCH IS NOT ACTIVE
                            //loop through all pokemon list to get views for all pokemon
                            if (searchText.isEmpty) {
                                ForEach(client.allPokemon, id: \.self) { pokemon in
                                    PokemonView(pokemon: pokemon ?? defaultPokemon, collected: model.collectedPokemon[pokemon?.id ?? 0] ?? false)
                                }
                            } else {
                                //search active: only show pokemon that have search text in their name
                                let searchedArray = client.allPokemon.filter{ $0?.name.contains((searchText).lowercased()) ?? false}
                                ForEach(searchedArray, id: \.self) { pokemon in
                                    PokemonView(pokemon: pokemon ?? defaultPokemon, collected: model.collectedPokemon[pokemon?.id ?? 0] ?? false)
                                    
                                }
                            }
                            
                        }
                    }
                    Spacer()
                }            
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    CollectionScreen(selectedTab: .constant(3))
        .environment(GameModel())
        .environment(NetworkClient())
}
