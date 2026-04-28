//
//  DataStructures.swift
//  pokelife
//
//  Created by Student on 4/27/26.
//

import Foundation
import SwiftUI

//TODO add codable
struct Pokemon : Identifiable, Codable {
    let id : Int
    let front_default : String
    let name : String
}

struct Task {
    let points : Int //Amount of points gained for one completion of task
    let systemIcon : String //system icon used for the task
    let taskText : String
}
