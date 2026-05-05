
import SwiftUI

@Observable
class NetworkClient {
    var allPokemon : [Pokemon?] = []
    
    func getPokemonData(id: Int) async -> Pokemon? {
        let urlStr: String = "https://pokeapi.co/api/v2/pokemon/\(id)"
        
        let url: URL? = URL(string: urlStr)
        guard let urlUnwrapped = url else {
            return nil
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
            let _ = response as! HTTPURLResponse
            let pokemon: Pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
            
            return pokemon
            
        } catch let error {
            print(error)
            return nil
        }
    }
    
    //get pokemon data but it takes in a URL as argument instead of ID
    func getPokemonData(urlStr: String) async -> Pokemon? {
        let url: URL? = URL(string: urlStr)
        guard let urlUnwrapped = url else {
            return nil
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
            let _ = response as! HTTPURLResponse
            let pokemon: Pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
            print("GET: \(pokemon.name)")
            return pokemon
            
        } catch let error {
            print(error)
            return nil
        }
    }
    
    //get a list of all pokemon as pokemon objects
    func getAllPokemon() async {
        //DONT run if all pokemon list isn't empty
        if (allPokemon.isEmpty){
            // get list of all pokemon
            // Change to limit 10000 later
            let urlString: String = "https://pokeapi.co/api/v2/pokemon?limit=100"
            
            let url: URL? = URL(string: urlString)
            guard let urlUnwrapped = url else {
                return
            }
            do {
                let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
                let _ = response as! HTTPURLResponse
                let results : AllURLlist = try JSONDecoder().decode(AllURLlist.self, from: data)
                //loop through results string endpoint,
                var pokemonArray: [Pokemon?] = []
                for pokeURL in results.urlStringList {
                    print("append1")
                    pokemonArray.append(await getPokemonData(urlStr: pokeURL))
                    print("append2")
                }
                allPokemon = pokemonArray
            } catch let error {
                print(error)
                return
            }
        }
    }
    
    //populate allPokemon array with 1 pokemon (id)
    func populateOneAllPokemon(id : Int) async {
        let pokemon = await getPokemonData(id: id)
        allPokemon.append(pokemon)
    }
}
