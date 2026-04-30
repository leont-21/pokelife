//
//  PokemonView.swift
//  pokelife
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct PokemonView: View {
    @Environment(NetworkClient.self) private var client
    @State var pokemon: Pokemon
    let collected: Bool
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokemon.sprites.frontDefault ?? "")) { image in
                image
                    .image?.resizable()
                    .brightness(collected ? 0 : -1)
                    .frame(width: 125, height: 125)
            }
            Text(pokemon.name)
            }
            .frame(width: 150, height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.red, lineWidth: 3)
                )
        }
    }


#Preview {
    PokemonView(pokemon: Pokemon(id: 67, sprite_path: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/681.png", frontShiny: "", backDefault: "", backShiny: ""), name: "aegislash shield", shiny:false), collected: false)
        .environment(NetworkClient())
}
