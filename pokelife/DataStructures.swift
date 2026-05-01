
import Foundation
import SwiftUI

struct Pokemon : Identifiable, Decodable {
    let id : Int
    let sprites : Sprites
    let name : String
    let shiny : Bool
    
    //enums for decoding
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case sprites
    }
    

    
    //custom decoder, default, sets shiny to false
    init (from decoder: Decoder) throws {
        let pokemon = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try pokemon.decode(Int.self, forKey: .id)
        self.name = try pokemon.decode(String.self, forKey: .name)
        self.sprites = try pokemon.decode(Sprites.self, forKey: .sprites)
        
        shiny = false
    }
    
    // custom decoder, sets shiny to shiny_s
    init (from decoder: Decoder, shiny_s : Bool) throws {
        let pokemon = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try pokemon.decode(Int.self, forKey: .id)
        self.name = try pokemon.decode(String.self, forKey: .name)
        self.sprites = try pokemon.decode(Sprites.self, forKey: .sprites)
        
        shiny = shiny_s
    }
    
    //debug: Directly create a pokemon without use of a json object
    init (id : Int, sprites : Sprites, name : String, shiny : Bool) {
        self.id = id
        self.name = name
        self.shiny = shiny
        self.sprites = sprites
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

//Class for getting the results list of all pokemon
struct AllURLlist : Decodable {
    //list of all pokemon as API urls
    let urlList: [PokeEndpoint]
    //converted api URLS to strings
    var urlStringList: [String] {
        if urlList.isEmpty {
            return []
        } else {
            return urlList.map { $0.url }
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
