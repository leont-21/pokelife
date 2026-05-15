
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


//static class which stores a dictionary for type colors
class TypeColors {
    static let typeColors : [String : Color] = [
        "bug" : Color(red: 0.4235, green: 0.5882, blue: 0.1647) /* #6c962a */,
        "electric" : Color(red: 1, green: 0.9725, blue: 0.2784) /* #fff847 */,
        "fire" : Color(red: 0.9294, green: 0.549, blue: 0.2588) /* #ed8c42 */,
        "fighting" : Color(red: 0.7176, green: 0.2, blue: 0.2) /* #b73333 */,
        "grass" : Color(red: 0.502, green: 1, blue: 0.4667) /* #80ff77 */,
        "water" : Color(red: 0.1804, green: 0.5882, blue: 0.9176) /* #2e96ea */,
        "ice" : Color(red: 0.7098, green: 1, blue: 0.9647) /* #b5fff6 */,
        "flying" : Color(red: 0.7294, green: 0.8, blue: 1) /* #baccff */,
        "rock" : Color(red: 0.5765, green: 0.5294, blue: 0.3882) /* #938763 */,
        "ground" : Color(red: 0.9098, green: 0.7608, blue: 0.4902) /* #e8c27d */,
        "steel" : Color(red: 0.6353, green: 0.6784, blue: 0.6706) /* #a2adab */,
        "poison" : Color(red: 0.7176, green: 0.2196, blue: 0.8196) /* #b738d1 */,
        "psychic" : Color(red: 0.9686, green: 0.3569, blue: 0.6745) /* #f75bac */,
        "dark" : Color(red: 0.2196, green: 0.102, blue: 0.0392) /* #381a0a */,
        "dragon" : Color(red: 0.3137, green: 0.2353, blue: 0.8196) /* #503cd1 */,
        "fairy" : Color(red: 1, green: 0.7765, blue: 0.9765) /* #ffc6f9 */,
        "ghost" : Color(red: 0.3176, green: 0.2078, blue: 0.4784) /* #51357a */,
        "normal" : Color(red: 0.8588, green: 0.8588, blue: 0.8588) /* #dbdbdb */
    ]
}
