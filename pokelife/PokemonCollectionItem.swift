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
            if let urlString : String = pokemon.sprites["front_default"] {
                
                AsyncImage( )
                    .frame(width: 140, height: 130)
                    .aspectRatio(contentMode: .fill)
                    .background(.green)
            }
        }
        .frame(width: 150, height: 200)
        .background(.black)
    }
}

#Preview {
    PokemonCollectionItem(pokemon: Pokemon(id: 67, sprites: ["front_default" : "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/681.png"] , name: "aegislash shield", shiny:false))
}
