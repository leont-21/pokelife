
import Foundation

//TODO add codable
struct Pokemon : Identifiable {
    let id : ID
    let front_default : String
    let name : String
}

enum selectedMenu {
    case start
    case main
    case gacha
}
