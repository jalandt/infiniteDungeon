//
//  Character2.swift
//  
//
//  Created by James Alandt on 6/9/20.
//

import Foundation

class character {
    var name: String
    var type: String
    var isDefeated: Bool
    var health: Int
    var maxHealth: Int
    var intellect: Int
    var charisma: Int
    var strength: Int
    var agility: Int
    var magic: Int
    var disposition: Int
    var will: Int
    var defense: Int
    var exp: Int
    var xpHealth: Int
    var xpStrength: Int
    var xpMagic: Int
    var xpAgility: Int
    var xpDefense: Int
    var xpIntellect: Int
    var xpCharisma: Int
    var level: Int
    var items = [item]()
    var actions = [String]()
    var isFriendly : Bool
    var isAnimal : Bool
    var hat: head?
    var nextLvl: Int
    init () {
        self.name = "unnamed"
        self.isDefeated = false
        self.health = 100
        self.maxHealth = 100
        self.intellect = 10
        self.charisma = 10
        self.strength = 10
        self.agility = 10
        self.magic = 10
        self.disposition = 0
        self.type = "default"
        self.defense = 1
        self.exp = 0
        self.xpMagic = 0
        self.xpHealth = 0
        self.xpAgility = 0
        self.xpDefense = 0
        self.xpCharisma = 0
        self.xpStrength = 0
        self.xpIntellect = 0
        self.level = 1
        self.will = 15
        self.isFriendly = false
        self.isAnimal = false
        self.nextLvl = 0
    }
    //recent change
    func levelUp () {
        if (self.exp - self.nextLvl) >= (15 + (15 * (self.level-1)))  {
            self.nextLvl = (15 * self.level)
            self.level += self.exp/(15*self.level)
            while self.xpMagic >= 5 {
                self.magic += 1
                self.xpMagic -= 5
            }
            while self.xpIntellect >= 5 {
                self.intellect += 1
                self.xpIntellect -= 5
            }
            while self.xpHealth >= 5 {
                self.maxHealth += 1
                self.xpHealth -= 5
            }
            while self.xpMagic >= 5 {
                self.magic += 1
                self.xpMagic -= 5
            }
            while self.xpAgility >= 5 {
                self.agility += 1
                self.xpAgility -= 5
            }
            while self.xpDefense >= 5 {
                self.defense += 1
                self.xpDefense -= 5
            }
            gameInfo.text = gameInfo.text + "\n\(self.name) has leveled up! \(self.level) is the level, \(self.magic) is magic, \(self.intellect) is intellect, \(self.health) is health, \(self.agility) is agility, \(self.defense)is defense, \(self.strength) is strength \(self.exp) is experience points"
        }
    }
    func auto(enemy: character, friend: character) {
        print("do nothing char level")
    }
    
    func loot () {
        create_treasure(item1: nil, item2: nil)
    }
    func equip (item: item) {
        let equipment = item.type
        switch equipment {
            case "Head":
                if let x = self.hat?.defense {
                    self.defense -= x
                    gameInfo.player.items.append(self.hat!)
                    self.hat = nil
                }
                self.hat = item as? head
                if let y = self.hat?.defense {
                    self.defense += y
                    }
             default:
                gameInfo.text = gameInfo.text + "\nUnable to equip item"
                gameInfo.player.items.append(item)
        }
    }
}
class human: character {
    var isAthletic: Bool
    var isNerdy: Bool
    var isTechy: Bool
    var isNature: Bool
    var isSpiritual: Bool
    var isScience: Bool
    var isQuiet: Bool
    var isTalkative: Bool
    var isCreative: Bool
    var isPractical: Bool
    var isClothed: Bool
    var shirt: chest?
    var gloves: hands?
    var tool: tool?
    var pants: legs?
    var shoes: feet?
    var xloc: Int
    var yloc: Int
    var partyLim: Int
    
    override init() {
        self.isAthletic = false
        self.isNerdy = false
        self.isTechy = false
        self.isNature = false
        self.isSpiritual = false
        self.isScience = false
        self.isQuiet = false
        self.isTalkative = false
        self.isCreative = false
        self.isPractical = false
        self.isClothed = false
        self.xloc = 0
        self.yloc = 0
        self.partyLim = 2
        super.init()
        let names = ["Joe", "Bill", "Bob", "Ken", "Jim", "Barry", "Steve", "Rob", "Austin", "Josh", "Julie", "Eric", "Sam", "Amber", "Tiffany", "Sally", "Jon", "Paul", "Pat", "Addison"]
        self.name = names.randomElement()!
        self.type = "Human"
        self.disposition = 3
        self.actions.append("attack")
        self.actions.append("heal")
    }
    
    func desc () -> String {
        var description = "\(self.type) "
        if self.isClothed == false {
            description = description + "naked"
        } else {
            description = description + "wearing"
        }
        if let s = self.shirt {
            description = description + " \(s.color) \(s.name)"
        }
        if let h = self.hat {
            description = description + ", \(h.color) \(h.name)"
        }
        if let g = self.gloves {
            description = description + ", \(g.color) \(g.name)"
        }
        if let shoe = self.shoes {
            description = description + ", \(shoe.color) \(shoe.name)"
        }
        if let p = self.pants {
            description = description + " and \(p.color) \(p.name)"
        }
        if let t = self.tool {
            description = description + " Carrying a \(t.name) that does \(t.damage) and has \(t.magic) magic"
        }
        description = description + " my defense is \(self.defense) and my strength is \(self.strength) and my magic is \(self.magic)"
        print(description)
        return description
    }
    func attack (target: character) {
        let hit = Int.random(in: 1...100)
        if hit > target.agility {
            if (self.strength - target.defense) >= 1 {
                target.health -= (self.strength-target.defense)
                target.will -= 1
                target.xpHealth += 1
                gameInfo.text = gameInfo.text + "\n\(self.name) attacks \(target.name) for \(self.strength-target.defense)"
            } else {
                gameInfo.text = gameInfo.text + "\n\(self.name) attacks \(target.name) but the attack is unable to do damage against \(target.name)'s defense"
            }
            self.xpStrength += 1
            target.disposition -= 1
            self.exp += 1
            target.xpDefense += 1
            
        } else {
            target.xpAgility += 1
            gameInfo.text = gameInfo.text + "\n\(target.name) avoided the attack by \(self.name)"
        }
    }
    func heal (target: character) {
        target.health += self.magic
        self.xpMagic += 1
        self.xpIntellect += 1
        self.exp += 1
        target.xpHealth += 1
        target.disposition += 1
        if target.health > target.maxHealth {
            target.health = target.maxHealth
        }
        gameInfo.text = gameInfo.text + "\n\(self.name) heals \(target.name) for \(self.magic)"
    }
    func tame (target: character, helper: Int) {
        if target.disposition > 7 {
            self.xpCharisma += 1
            gameInfo.party.append(target)
            gameInfo.text = gameInfo.text + "\n\(target.name) has joined the party!!"
            gameInfo.enemies.remove(at: helper)
        }   else if target.will < self.charisma {
            self.xpCharisma += 1
            gameInfo.party.append(target)
            gameInfo.text = gameInfo.text + "\n\(target.name) has joined the party!!"
            gameInfo.enemies.remove(at: helper)
        } else if target.isFriendly == true {
            self.xpCharisma += 1
            gameInfo.party.append(target)
            gameInfo.text = gameInfo.text + "\n\(target.name) has joined the party!!"
            gameInfo.enemies.remove(at: helper)
        } else {
            gameInfo.text = gameInfo.text + "\n\(target.name) said I don't fuck with you"
        }
        //return gameInfo.enemies
    }
    override func equip (item: item) {
        switch item.type {
        case "Head":
            if let x = self.hat?.defense {
                self.defense -= x
                gameInfo.player.items.append(self.hat!)
                self.hat = nil
            }
            self.hat = item as? head
            if let y = self.hat?.defense {
            self.defense += y
            }
            self.isClothed = true
        case "Chest":
            if let x = self.shirt?.defense {
                self.defense -= x
                gameInfo.player.items.append(self.shirt!)
                self.shirt = nil
            }
            self.shirt = item as? chest
            if let y = self.shirt?.defense {
                self.defense += y
            }
            self.isClothed = true
        case "Legs":
            if let x = self.pants?.defense {
                self.defense -= x
                gameInfo.player.items.append(self.pants!)
                self.pants = nil
            }
            self.pants = item as? legs
            if let y = self.pants?.defense {
                self.defense += y
            }
            self.isClothed = true
        case "Hands":
            if let x = self.gloves?.defense {
                self.defense -= x
                gameInfo.player.items.append(self.gloves!)
                self.gloves = nil
            }
            self.gloves = item as? hands
            if let y = self.gloves?.defense {
                self.defense += y
            }
            self.isClothed = true
        case "Feet":
            if let x = self.shoes?.defense {
                self.defense -= x
                gameInfo.player.items.append(self.shoes!)
                self.shoes = nil
            }
            self.shoes = item as? feet
            if let y = self.shoes?.defense {
                self.defense += y
            }
            self.isClothed = true
        case "Tool":
            if let x = self.tool?.damage {
                gameInfo.player.items.append(self.tool!)
                self.strength -= x
            }
            if let m = self.tool?.magic {
                self.magic -= m
            }
            self.tool = nil
            self.tool = item as? tool
            if let x = self.tool?.damage {
                self.strength += x
            }
            if let y = self.tool?.magic {
                self.magic += y
            }
        default:
            print("\(item.type) was not able to be equipped!")
        }
    }
    func moveUp () {
        self.yloc += 1
    }
    func moveDown () {
        self.yloc -= 1
    }
    func moveLeft() {
        self.xloc -= 1
    }
    func moveRight () {
        self.xloc += 1
    }
    override func auto (enemy: character, friend: character) {
        
        let use = self.actions.randomElement()
        switch use {
        case "attack":
            self.attack(target: enemy)
        case "heal":
            self.heal(target: friend)
        default:
            print("nothing happened")
        }
    }
    
    func action(move: String, target: character, helper: Int) {
        
        switch move {
        case "attack":
            self.attack(target: target)
        case "heal":
            self.heal(target: target)
        case "recruit":
            self.tame(target: target, helper: helper)
        default:
            print("nothing happened")
        }
    }
    func abandon (target: character) {
        
    }

}
class animal: character {

    var canRide: Bool
    init(name: String) {
        self.canRide = false
        super.init()
        self.will = 5
        self.isFriendly = false
        self.name = name
        self.type = "An Animal"
        self.actions.append("bite")
        self.actions.append("tackle")
        self.isAnimal = true
    }
    
    func bite (target: character) {
    let hit = Int.random(in:1...100)
    if hit > target.agility {
        if (25 - target.defense) >= 1 {
            target.health -= (self.strength-target.defense)
            target.will -= 1
            target.xpHealth += 1
            target.xpDefense += 1
            gameInfo.text = gameInfo.text + "\n\(self.name) bites \(target.name) for \(self.strength-target.defense)"
        } else {
            gameInfo.text = gameInfo.text + "\n\(self.name) bites \(target.name) but breaks a tooth on \(target.name)'s armor"
        }
        self.xpStrength += 1
        target.disposition -= 1
        self.exp += 1
    } else {
        target.xpAgility += 1
        gameInfo.text = gameInfo.text + "\n\(target.name) avoids \(self.name)'s bite"
        }
    }
    func tackle (target: character) {
        let hit = Int.random(in:1...100)
        if hit > target.agility {
         if (self.strength - target.defense) >= 1 {
             target.health -= (self.strength-target.defense)
             target.will -= 1
             target.xpHealth += 1
            target.xpDefense += 1
             gameInfo.text = gameInfo.text + "\n\(self.name) tackles \(target.name) for \(self.strength-target.defense)"
         } else {
             gameInfo.text = gameInfo.text + "\n\(self.name) throws themself at \(target.name) but bounces off harmlessly"
         }
         self.xpStrength += 1
         target.disposition -= 1
         self.exp += 1
    }else {
    target.xpAgility += 1
    gameInfo.text = gameInfo.text + "\n\(target.name) avoids \(self.name)'s tackle"
        }
    }
    override func auto (enemy: character, friend: character) {
    
        let use = self.actions.randomElement()
    switch use {
    case "tackle":
        self.tackle(target: enemy)
    case "bite":
        self.bite(target: enemy)
    default:
        print("nothing happened")
        }
    }
}
class dog: animal {
    init() {
        let names = ["Buddy", "Lassie", "Air Bud", "Domino", "Bessie"]
        super.init(name: names.randomElement()!)
        let types = ["Golden Retriever", "Pit Bull", "German Shepard", "Doberman", "Labrador Retriever", "Rottweiler"]
        self.type = types.randomElement()!
        self.health = 60
        self.maxHealth = 60
        self.intellect = 5
        self.charisma = 1
        self.strength = 15
        self.agility = 12
        self.magic = 1
        self.disposition = 6
        self.isFriendly = true
    }

    override func auto (enemy: character, friend: character) {
    let use = actions.randomElement()
    switch use {
    case "tackle":
        self.tackle(target: enemy)
    case "bite":
        self.bite(target: enemy)
    default:
        print("nothing happened")
        }
    }
}
    
class wolverine: animal {
    init() {
        let names = ["Wilson", "Logan", "Stan", "Wally", "Wanker"]
        super.init(name: names.randomElement()!)
        self.type = "Wolverine"
        self.health = 200
        self.maxHealth = 200
        self.intellect = 2
        self.charisma = 0
        self.strength = 30
        self.agility = 10
        self.magic = 0
        self.disposition = -3
        self.isFriendly = false
        self.will = 20
    }
}

class cat: animal {
    init() {
        let names = ["Kitty", "Figuero", "Tom", "Hank", "Blitz", "Fuzzy"]
        super.init(name: names.randomElement()!)
        self.type = "Cat"
        self.health = 50
        self.maxHealth = 50
        self.intellect = 10
        self.charisma = 5
        self.strength = 15
        self.agility = 30
        self.magic = 0
        self.disposition = -1
        self.isFriendly = false
        self.actions.append("scratch")
        
    }
    func scratch (target: character) {
        let hit = Int.random(in:1...100)
        if hit > target.agility {
            if (18 - target.defense) >= 1 {
                target.health -= (self.strength-target.defense)
                target.will -= 1
                target.xpHealth += 1
                target.xpDefense += 1
                gameInfo.text = gameInfo.text + "\n\(self.name) scratches \(target.name) for \(self.strength-target.defense)"
            } else {
                gameInfo.text = gameInfo.text + "\n\(self.name) attacks \(target.name) but the attack is unable to do damage against \(target.name)'s defense"
            }
            self.xpStrength += 1
            target.disposition -= 1
            self.exp += 1
        } else {
            target.xpAgility += 1
            gameInfo.text = gameInfo.text + "\n\(target.name) avoids \(self.name)'s scratch"
            }
    }
    override func auto (enemy: character, friend: character) {
    let use = actions.randomElement()
    switch use {
    case "tackle":
        self.tackle(target: enemy)
    case "bite":
        self.bite(target: enemy)
    case "scratch":
        self.scratch(target: enemy)
    default:
        print("nothing happened")
        }
    }
}

class gremlin: animal {
    init() {
        let names = ["Gizmo", "Garlin", "Sbarro", "Picanzo", "Gonzo", "Diddly", "Flanders", "Milhouse", "Bingo"]
        super.init(name: names.randomElement()!)
        self.maxHealth = 60
        self.health = 60
        self.strength = 50
        self.magic = 50
        self.disposition = -20
        self.type = "Gremlin"
        self.intellect = 10
        self.actions.append("blast")
        self.actions.append("trap")
    }
    func blast (target: character) {
        let hit = Int.random(in:1...100)
        if hit > target.agility {
        target.health -= self.magic
        self.xpMagic += 1
        self.exp += 1
        gameInfo.text = gameInfo.text + "\n\(self.name) shoots a magic blast at \(target.name) for \(self.magic) damage"
        } else {
            gameInfo.text = gameInfo.text + "\n\(self.name)'s magic blast whizzes past \(target.name) harmlessly "
        }
    }
    func trap (target: character) {
        target.health -= self.intellect
        self.xpIntellect += 1
        self.exp += 1
        gameInfo.text = gameInfo.text + "\n\(self.name)'s booby trap dealt \(self.intellect) damage to \(target.name)"
    }
    override func auto (enemy: character, friend: character) {
    
    let use = self.actions.randomElement()
     switch use {
     case "tackle":
         self.tackle(target: enemy)
     case "bite":
         self.bite(target: enemy)
     case "blast":
         self.blast(target: enemy)
     case "trap":
        self.trap(target: enemy)
     default:
         print("nothing happened")
         }
     }
}

class ogre: animal {
    init() {
        let names = ["Unga", "Grunga", "Blunga", "Drunga", "Cowa", "Bunga", "Sungra", "Carl"]
        super.init(name: names.randomElement()!)
        self.maxHealth = 500
        self.health = 500
        self.strength = 80
        self.disposition = -80
        self.will = 20
        self.charisma = 8
        self.magic = 11
        self.type = "Ogre"
        self.actions.append("smash")
        self.actions.append("crush")
    }
    func smash (target: character) {
        let hit = Int.random(in:1...100)
        if hit > target.agility {
            target.health -= (self.strength - target.defense)
            target.xpDefense += 1
            self.xpStrength += 1
            gameInfo.text = gameInfo.text + "\n\(self.name) smashes \(target.name) for \(self.strength - target.defense) damage"
        } else {
            target.xpAgility += 1
            self.will -= 1
            gameInfo.text = gameInfo.text + "\n\(self.name)'s smash attack badly misses \(target.name) and hurts itself for 80 damage"
            self.health -= 80
            self.will -= 1
        }
    }
    func crush (target: character) {
        let hit = Int.random(in:1...100)
        if hit > target.agility {
            target.health -= (60 - target.defense)
            gameInfo.text = gameInfo.text + "\n\(self.name) crushes \(target.name) for \(60 - target.defense) damage"
        } else {
            gameInfo.text = gameInfo.text + "\n\(self.name) misses \(target.name) and hurts itself for 60 damage"
            self.health -= 60
            self.will -= 1
        }
    }
    override func auto (enemy: character, friend: character) {
    
        let use = self.actions.randomElement()
     switch use {
     case "tackle":
        self.tackle(target: enemy)
     case "bite":
        self.bite(target: enemy)
     case "crush":
        self.crush(target: enemy)
     case "smash":
        self.smash(target: enemy)
     default:
         print("nothing happened")
         }
     }
}

class gator: animal {
    init() {
        let names = ["Gary", "Georgie", "Sharp Tooth", "Reptile", "Scales", "Dino", "Stumpy", "Ornry", "Orville"]
        super.init(name: names.randomElement()!)
        self.maxHealth = 300
        self.health = 300
        self.strength = 60
        self.disposition = -40
        self.will = 25
        self.charisma = 2
        self.magic = 5
        self.type = "Alligator"
        self.actions.append("roll")
    }
    
    func roll (target: character) {
        let hit = Int.random(in:1...100)
        if hit > target.agility {
            target.health -= 60
            target.will -= 1
            target.xpHealth += 1
            gameInfo.text = gameInfo.text + "\n\(self.name) death rolls \(target.name) for 60 damage"
            target.disposition -= 1
            self.exp += 1
        } else {
            target.xpAgility += 1
            gameInfo.text = gameInfo.text + "\n\(target.name) avoids \(self.name)'s death roll"
            }
    }
    override func auto(enemy: character, friend: character) {
        let use = self.actions.randomElement()
        switch use {
        case "tackle":
            self.tackle(target: enemy)
        case "bite":
            self.bite(target: enemy)
        case "roll":
            self.roll(target: enemy)
        default:
            print("nothing happened")
            }
    }
}

class Lion: animal {
    init() {
        let names = ["Leo", "Roary", "Lexington", "King", "Slay", "Brawn", "Stoney"]
        super.init(name: names.randomElement()!)
        self.maxHealth = 600
        self.health = 600
        self.strength = 80
        self.disposition = -5
        self.will = 50
        self.charisma = 40
        self.magic = 25
        self.agility = 25
        self.type = "Lion"
        self.actions.append("roar")
        self.actions.append("pounce")
    }
    func pounce (target: character) {
        let hit = Int.random(in:1...100)
        if hit > target.agility {
            target.health -= (self.strength - target.defense)
            target.will -= 1
            target.xpHealth += 1
            gameInfo.text = gameInfo.text + "\n\(self.name) pounces on  \(target.name) for \(self.strength - target.defense)"
            target.disposition -= 1
            self.exp += 1
        } else {
            target.xpAgility += 1
            gameInfo.text = gameInfo.text + "\n\(target.name) dodges \(self.name)'s lunge"
            }
    }
    
    func roar (target: character) {
        target.health -= self.magic
        self.xpMagic += 1
        target.will -= 1
        target.xpHealth += 1
        gameInfo.text = gameInfo.text + "\n\(self.name) lets out a thunderous roar dealing \(target.name) \(self.magic) damage"
    }
    override func auto (enemy: character, friend: character) {
    
         let use = self.actions.randomElement()
        switch use {
        case "tackle":
            self.tackle(target: enemy)
        case "bite":
            self.bite(target: enemy)
        case "roar":
            self.roar(target: enemy)
        case "pounce":
            self.pounce(target: enemy)
        default:
            print("nothing happened")
         }
     }
}
class dragon: animal {
    init () {
        let names = ["Draco", "Copernicus", "Travis", "Zarkoff", "Zale", "Earth", "Fire", "Ice", "Wind", "DeAndre", "Tyrone", "Lily", "Dredna", "Smirnoff"]
        super.init(name: names.randomElement()!)
        self.maxHealth = 10000
        self.health = 10000
        self.strength = 100
        self.disposition = -50
        self.will = 50
        self.charisma = 40
        self.magic = 40
        self.type = "Dragon"
        self.actions.append("burn")
    }
    func burn  (target: character) {
        let hit = Int.random(in:1...100)
        if hit > target.agility {
            target.health -= 55
            target.will -= 1
            target.xpHealth += 1
            gameInfo.text = gameInfo.text + "\n\(self.name) roasts \(target.name) for 55"
            target.disposition -= 1
            self.exp += 1
        } else {
            target.xpAgility += 1
            gameInfo.text = gameInfo.text + "\n\(target.name) avoids \(self.name)'s inferno"
            }
    }
    override func auto (enemy: character, friend: character) {
   
        let use = self.actions.randomElement()
    switch use {
    case "tackle":
        self.tackle(target: enemy)
    case "bite":
        self.bite(target: enemy)
    case "burn":
        self.burn(target: enemy)
    default:
        print("nothing happened")
        }
    }
}




func create_enemies () -> Array<character> {
    let decide2 = ["y", "n"]
    var enemies = [character]()
    var enemyList = [human(), dog(), cat()]
    if gameInfo.player.xloc >= 5 || gameInfo.player.xloc <= -5 || gameInfo.player.yloc >= 5 || gameInfo.player.yloc <= -5 {
        enemyList.append(wolverine())
        enemyList.append(gremlin())
        enemyList.append(ogre())
        enemyList.append(gator())
    }
    if gameInfo.player.xloc >= 10 || gameInfo.player.xloc <= -10 || gameInfo.player.yloc >= 10 || gameInfo.player.yloc <= -10 {
        enemyList.append(dragon())
        enemyList.append(Lion())
    }
    let e1 = enemyList.randomElement()!
    enemies.append(e1)
    print("there are \(enemies.count) enemies")
    if decide2.randomElement() == "y" {
        enemies.append(enemyList.randomElement()!)
    }
    if decide2.randomElement() == "y" {
        enemies.append(enemyList.randomElement()!)
    }
    gameInfo.text = gameInfo.text + "\nThere is"
    for i in enemies {
        gameInfo.text = gameInfo.text + " a \(i.type) named \(i.name) "
    }
    gameInfo.room.enemy = false
    return enemies
}

func auto_battle(friends: Array<character>, enemies: Array<character>){
    var allParty = friends
    allParty.append(gameInfo.player)
    var opponents = enemies
    for a in friends {
        let jerk = enemies.randomElement()!
        let not_Jerk = allParty.randomElement()!
        a.auto(enemy: jerk, friend: not_Jerk)
        if jerk.health <= 0 {
            opponents.removeAll(where: {$0 === jerk})
            gameInfo.text = gameInfo.text + "\n\(jerk.name) collapses from injuries"
        }
    }
    for e in opponents {
        let jerk = allParty.randomElement()!
        let not_Jerk = opponents.randomElement()!
        e.auto(enemy: jerk, friend: not_Jerk)
    }
}

func remove_dead (p: Array<character>) -> Array<character>  {
    var newp = p
    var x = 0
    while x < newp.count {
    if newp[x].health <= 0 {
        newp[x].loot()
        print("removing \(newp[x].name)")
        newp.remove(at: x)
    } else {
        x += 1
        }
    }
        return newp
}
