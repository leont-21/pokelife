//
//  PokemonCollectionItem.swift
//  pokelife
//
//  Created by Student on 4/29/26.
//

import SwiftUI

//displays a pokemon inside the pokemon collection.

struct PokemonCollectionItem: View {
    //pokemon displayed
    var pokemon : Pokemon
    var body: some View {
        VStack {
//            AsyncImage(url: URL(string: pokemon.sprites["front_default"]))
//                .frame(width: 140, height: 130)
//                .aspectRatio(contentMode: .fill)
//                .background(.green)
        }
        .frame(width: 150, height: 200)
        .background(.black)
    }
}

// Fix Preview
//#Preview {
//    PokemonCollectionItem(pokemon: Pokemon(id: 67, sprite_path: ["front_default" : "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/681.png"], name: "aegislash shield", shiny:false))
//}
