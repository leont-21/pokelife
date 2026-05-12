
import SwiftUI

@Observable
class GameModel {
    private(set) var menu: SelectedMenu = SelectedMenu.start
    // private(set) var gachaActivated = false
    private(set) var tickets = 0
    //dictionary of all pokemon ids and whether theyve been collected or not
    private(set) var collectedPokemon : [Int : Bool] = [:]
    
    init () {
        tickets = 5
        menu = SelectedMenu.start
        collectedPokemon = [:]
    }
    
    func addTickets(amt: Int) {
        tickets += amt
    }
    
    func gachaPlay() -> Int? {
        // adds new pokemon to collection & returns result to GachaGame()
        guard tickets > 0 else { return nil }
        tickets -= 1
        let randomPokemonID = Int.random(in: 1...151)
        
        collectedPokemon[randomPokemonID] = true
        return randomPokemonID
    }
    
    //adds a pokemon id to the collected pokemon list
    func addIDtoCollectedPokemon(id : Int) {
        collectedPokemon[id] = false
    }
    
    //sets an id in collected pokemon list to true
    func collectPokemon(id: Int) {
        collectedPokemon[id] = true
    }
}
    
