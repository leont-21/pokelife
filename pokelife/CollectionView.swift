//
//  CollectionView.swift
//  pokelife
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct CollectionScreen: View {
    @Environment(GameModel.self) private var model: GameModel

    
    var body: some View {
        ForEach(model.pokemonCollection, id: \.self) { pokemonID in
            PokemonView()
        }
    }
}

#Preview {
    CollectionScreen()
        .environment(GameModel())
}
