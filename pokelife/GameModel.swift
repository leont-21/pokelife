
import SwiftUI

@Observable
class GameModel {
    private(set) var menu: SelectedMenu = SelectedMenu.start
    // private(set) var gachaActivated = false
    private(set) var tickets = 0
    //dictionary of all pokemon ids and whether theyve been collected or not
    private(set) var collectedPokemon : [Int : Bool] = [:]
    
    init () {
        tickets = 0
        menu = SelectedMenu.start
        collectedPokemon = [:]
    }
    
    func gachaPlay() {
        if tickets < 1 {
            tickets = tickets - 1
            GachaGame()
            // make this add a random pokemon to the player's collectedPokemon
            // display this new pokemon on screen
        }
    }
}
