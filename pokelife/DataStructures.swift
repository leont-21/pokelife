
import Foundation
import SwiftUI

struct Pokemon : Identifiable, Decodable, Hashable {
    let id : Int
    let sprites : Sprites
    let name : String
    let type1 : String
    let type2 : String?
    let shiny : Bool
    
    
    //hashable
    static func == (lPoke: Pokemon, rPoke: Pokemon) -> Bool {
        return lPoke.id == rPoke.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
    //enums for decoding
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case sprites
        case types
    }
    

    
    //custom decoder, default, sets shiny to false
    init (from decoder: Decoder) throws {
        let pokemon = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try pokemon.decode(Int.self, forKey: .id)
        self.name = try pokemon.decode(String.self, forKey: .name)
        self.sprites = try pokemon.decode(Sprites.self, forKey: .sprites)

        let types = try pokemon.decode([TypeSlot].self, forKey: .types)
        type1 = types[0].type.name
        if (types.count > 1) {
            type2 = types[1].type.name
        } else {
            type2 = nil
        }
        shiny = false
    }
    
    // custom decoder, sets shiny to shiny_s
    init (from decoder: Decoder, shiny_s : Bool) throws {
        let pokemon = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try pokemon.decode(Int.self, forKey: .id)
        self.name = try pokemon.decode(String.self, forKey: .name)
        self.sprites = try pokemon.decode(Sprites.self, forKey: .sprites)
        
        let types = try pokemon.decode([TypeSlot].self, forKey: .types)
        type1 = types[0].type.name
        if (types.count > 1) {
            type2 = types[1].type.name
        } else {
            type2 = nil
        }
        shiny = shiny_s
    }
    
    //debug: Directly create a pokemon without use of a json object
    init (id : Int, sprite_path : Sprites, name : String, shiny : Bool, type1: String, type2: String?) {
        self.id = id
        self.name = name
        self.shiny = shiny
        self.sprites = sprite_path
        self.type1 = type1
        self.type2 = type2
    }
}

struct Sprites: Decodable {
    let frontDefault: String?
    let frontShiny: String?
    let backDefault: String?
    let backShiny: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
    }
}

struct TypeSlot: Decodable {
    let type: PokeType
}

struct PokeType: Decodable {
    let name: String
}

//Class for getting the results list of all pokemon
struct AllURLlist : Decodable {
    //list of all pokemon as API urls
    let results: [PokeEndpoint]
    //converted api URLS to strings
    var urlStringList: [String] {
        if results.isEmpty {
            return []
        } else {
            return results.map { $0.url }
        }
    }
}

struct PokeEndpoint : Decodable {
    let url: String
}

//A single result entry

struct Task {
    let points : Int //Amount of points gained for one completion of task
    let systemIcon : String //system icon used for the task
    let taskText : String
}

enum SelectedMenu { // selected screen
    case start
    case main
    case gacha
    case collection
}
