//
//  NetworkClient.swift
//  pokelife
//
//  Created by Student on 4/28/26.
//

import SwiftUI

@Observable
class NetworkClient {
    func getPokemonData(id: Int) async {
        let urlStr: String = "https://pokeapi.co/api/v2/pokemon/\(id)"
        
        let url: URL? = URL(string: urlStr)
        guard let urlUnwrapped = url else {
            return
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
            let _ = response as! HTTPURLResponse
            let pokemon: Pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
        } catch let error {
            print(error)
        }
    }
}
