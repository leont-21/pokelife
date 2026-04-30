
import SwiftUI

@Observable
class GameModel {
    private(set) var tickets = 0
    private(set) var menu: SelectedMenu = SelectedMenu.start
    private(set) var pokemonCollection : [Int] = []
    
    //debug function to set pokemonCollection
    func setCollection(list : [Int]) {
        pokemonCollection = list
    }
}
