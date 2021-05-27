//
//  Room.swift
//  
//
//  Created by James Alandt on 5/21/20.
//

import Foundation

class Room {
    var chest: Bool
    var enemy: Bool
    var hLocation: Int
    var vLocation: Int
    var nExit: Bool
    var sExit: Bool
    var wExit: Bool
    var eExit: Bool
    var newRoom: Bool
    init (x: Int, y: Int){
        chest = false
        let e = ["y", "n", "n", "n"]
        if e.randomElement() == "y" {
            enemy = true
        }else{
            enemy = false   
        }
        self.hLocation = x
        self.vLocation = y
        let decide = [true, false, true]
        self.newRoom = false
        self.nExit = decide.randomElement()!
        self.sExit = decide.randomElement()!
        self.eExit = decide.randomElement()!
        self.wExit = decide.randomElement()!
        if self.hLocation <= -50 {
            self.wExit = false
         }
        if self.hLocation >= 50 {
            self.eExit = false
         }
        if self.vLocation <= -50 {
            self.sExit = false
         }
        if self.vLocation >= 50 {
            self.nExit = false
         }
         
        while self.nExit == false && self.sExit == false && self.eExit == false && self.wExit == false{
          self.nExit = decide.randomElement()!
          self.sExit = decide.randomElement()!
          self.eExit = decide.randomElement()!
          self.wExit = decide.randomElement()!
        }
    }
    func ask() {
        print("\(self.hLocation),\(self.vLocation) chest in the room \(self.chest) enemy in the room \(self.enemy) north exit is \(self.nExit), south exit is \(self.sExit), east exit is \(self.eExit), west exit is \(self.wExit)")
    }
}
