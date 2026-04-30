
import SwiftUI

@Observable
class GameModel {
    private(set) var tickets = 0
    private(set) var menu: SelectedMenu = SelectedMenu.start
    //dictionary of all pokemon ids and whether theyve been collected or not
    private(set) var collectedPokemon : [Int : Bool] = [:]
    
    init () {
        tickets = 0
        menu = SelectedMenu.start
        collectedPokemon = [:]
    }
    
}
