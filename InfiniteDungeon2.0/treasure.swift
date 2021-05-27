//
//  treasure.swift
//  
//
//  Created by James Alandt on 6/11/20.
//

import Foundation

class treasure {
    var treasure: item
    var opened: Bool
    init() {
        let treasures = [head(), chest(), key(), fruit(), meat(), feet(), legs(), hands(), sword(), staff()]
        self.treasure = treasures.randomElement()!
        opened = false
    }
    func open() {
        opened = true
        print("Chest is opened. \(self.treasure.name) is inside!")
    }
}

func create_treasure (item1: item?, item2: item?) {
    let decide = ["y", "n"]
    var treasures = [head(), chest(), key(), fruit(), meat(), feet(), legs(), hands(), sword(), staff()]
    if gameInfo.player.xloc >= 5 || gameInfo.player.xloc <= -5 || gameInfo.player.yloc >= 5 || gameInfo.player.yloc <= -5 {
        treasures.append(nunchuck())
    }
    if gameInfo.player.xloc >= 10 || gameInfo.player.xloc <= -10 || gameInfo.player.yloc >= 10 || gameInfo.player.yloc <= -10 {
        treasures.append(stars())
    }
    if let i1 = item1 {
        treasures.append(i1)
    }
    if let i2 = item2 {
        treasures.append(i2)
    }
    if decide.randomElement() == "y" {
    gameInfo.loot.append(treasures.randomElement()!)
        }
    if decide.randomElement() == "y" {
        gameInfo.loot.append(treasures.randomElement()!)
    }
    if decide.randomElement() == "y" {
        gameInfo.loot.append(treasures.randomElement()!)
    }
}
