//
//  gameInfo.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 7/6/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import Foundation

struct GameInfo {
    var party: Array<character>
    var enemies: Array<character>
    var player: human
    var room: Room
    var loot: Array<item>
    var text: String
}


var gameInfo = GameInfo.init(party: [character]() , enemies: [character](), player: user, room: room, loot: [item](), text: "Welcome to Infinite Dungeon")
