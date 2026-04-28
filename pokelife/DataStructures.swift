
import Foundation
import SwiftUI

struct Pokemon : Identifiable, Decodable {
    let id : Int
    let sprite_path : String
    let name : String
    let shiny : Bool
    
    //enums for decoding
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case sprites
    }
    
    enum CodingKeys2 : String, CodingKey {
        case front_default
    }
    
    //custom decoder, default, sets shiny to false
    init (from decoder: Decoder) throws {
        let pokemon = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try pokemon.decode(Int.self, forKey: .id)
        self.name = try pokemon.decode(String.self, forKey: .sprites)
        
        let sprites = try pokemon.nestedContainer(keyedBy: CodingKeys2.self, forKey: .sprites)
        self.sprite_path = try sprites.decode(String.self, forKey: .front_default)
        
        shiny = false
    }
    
    // custom decoder, sets shiny to shiny_s
    init (from decoder: Decoder, shiny_s : Bool) throws {
        let pokemon = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try pokemon.decode(Int.self, forKey: .id)
        self.name = try pokemon.decode(String.self, forKey: .sprites)
        
        let sprites = try pokemon.nestedContainer(keyedBy: CodingKeys2.self, forKey: .sprites)
        self.sprite_path = try sprites.decode(String.self, forKey: .front_default)
        
        shiny = shiny_s
    }
}


struct Task {
    let points : Int //Amount of points gained for one completion of task
    let systemIcon : String //system icon used for the task
    let taskText : String
}

enum SelectedMenu { // selected screen
    case start
    case main
    case gacha
}
