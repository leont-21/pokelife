//
//  PokemonView.swift
//  pokelife
//
//  Created by Student on 4/29/26.
//

import SwiftUI

struct PokemonView: View {
    @Environment(NetworkClient.self) private var client
    @State private var pokemon: Pokemon?
    
    var body: some View {
        Text(pokemon?.name ?? "Loading...")
            .task {
                await pokemon = client.getPokemonData(id: 5)
            }
        }
    }


#Preview {
    PokemonView()
        .environment(NetworkClient())
}
