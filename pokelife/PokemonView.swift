
import SwiftUI

struct PokemonView: View {
    @Environment(NetworkClient.self) private var client
    @State var pokemon: Pokemon
    static let lightTypes = ["normal", "flying", "ice", "electric", "grass", "fairy", "ground"]
    let collected: Bool
    var typeGradient : LinearGradient {
        var colors = [TypeColors.typeColors[pokemon.type1] ?? .black]
        if let type2 = pokemon.type2 {
            colors.append(TypeColors.typeColors[type2] ?? .black)
        }
        return LinearGradient(colors: colors, startPoint: .top, endPoint: .bottom)
    }
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .brightness((pokemon.type2 != nil) ? 0.001 : 0.2)
                .foregroundStyle(typeGradient)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            typeGradient,
                            lineWidth: 4
                        )
                        .rotationEffect(.degrees(180))
                )
            AsyncImage(url: URL(string: pokemon.shiny ? pokemon.sprites.frontShiny ?? "" : pokemon.sprites.frontDefault ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw_HeSzHfBorKS4muw4IIeVvvRgnhyO8Gn8w&s")) { image in
                image
                    .image?.resizable()
                    .brightness(collected ? 0 : -1)
                    .frame(width: 125, height: 125)
                    .padding(.bottom)
            }
            VStack {
                Text("")
                    .frame(height: 100)
                Text(pokemon.name.capitalized)
                    .foregroundStyle( PokemonView.lightTypes.contains(pokemon.type2 ?? "") || (pokemon.type2 == nil && PokemonView.lightTypes.contains(pokemon.type1) ) ? .black : .white)
            }
        }
        .frame(width: 150, height: 150)
            .overlay(alignment: .topTrailing) {
                Text("#\(pokemon.id)")
                    .padding([.top, .trailing], 5)
            }
        }
        
    }


#Preview {
    PokemonView(pokemon: Pokemon(id: 681, sprite_path: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/681.png", frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/681.png", backDefault: "", backShiny: ""), name: "aegislash shield", shiny: false, type1: "ghost", type2: "steel"), collected: true)
        .environment(NetworkClient())
}
