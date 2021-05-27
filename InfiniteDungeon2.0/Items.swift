//
//  Items.swift
//  
//
//  Created by James Alandt on 6/9/20.
//

import Foundation

class item {
    var type: String
    var name: String
    var isFood: Bool
    var isTool: Bool
    var canEquip: Bool
    var level: Int
    init(type: String){
        self.type = type
        self.name = "item"
        self.isFood = false
        self.isTool = false
        self.canEquip = false
        self.level = gameInfo.player.level
    }
    func use(target: character) {
        print("use \(self.name)")
    }
}

class food: item {
    var benefit: Int
    var isMeat: Bool
     init() {
        self.benefit = 2
        self.isMeat = false
        super.init(type: "food")
        self.name = "food"
        self.benefit = 2 + gameInfo.player.level
        self.isFood = true
    }
    override func use(target: character) {
        target.health += self.benefit
        gameInfo.text = gameInfo.text + "\n\(target.name) eats \(self.name) for \(self.benefit)"
        target.disposition += 1
    }
}

class tool: item {
    var damage: Int
    var magic: Int
    init() {
        self.damage = 2
        self.magic = 2
        super.init(type: "Tool")
        self.name = "tool"
        self.isTool = true
        self.canEquip = true
    }
}

class fruit: food {
     override init() {
        super.init()
        let types = ["Apple", "Orange", "Cherries", "Kiwi", "Pear", "Strawberries", "Peach"]
        self.type = "fruit"
        self.name = types.randomElement()!
        self.benefit = 3 + gameInfo.player.level
    }
}

class meat: food {
    override init() {
        let names = ["Ribs", "Steak"]
        super.init()
        self.type = "meat"
        self.name = names.randomElement()!
        self.isMeat = true
        self.benefit = 3 + gameInfo.player.level
    }
}

class sword: tool {
    override init() {
        super.init()
        self.damage = 5 + gameInfo.player.level
        self.magic = 1 + gameInfo.player.level
        self.name = "A Sword"
    }
}

class staff: tool {
    override init() {
        super.init()
        self.damage = 3 + gameInfo.player.level
        self.magic = 5 + gameInfo.player.level
        self.name = "A Staff"
    }
}

class nunchuck: tool {
    override init() {
        super.init()
        self.damage = 8 + gameInfo.player.level
        self.magic = 5 + gameInfo.player.level
        self.name = "Nunchucks"
    }
}

class stars: tool {
    override init() {
        super.init()
        self.damage = 10 + gameInfo.player.level
        self.magic = 10 + gameInfo.player.level
        self.name = "Ninja Stars"
    }
}

class armor: item {
    var defense: Int
    var color: String
    override init(type: String) {
        self.defense = 10
        let colors = ["Red", "Blue", "Yellow", "Orange", "Green", "Purple", "Black", "White", "Khaki", "Gold", "Silver"]
        self.color = colors.randomElement()!
        super.init(type: type)
        self.name = "Armor"
        self.canEquip = true
        
    }
}

class head: armor {
     init() {
        super.init(type: "Head")
        let types = ["Ball Cap", "Fedora", "Football Helmet", "Chef Hat", "Wizard Hat"]
        self.name = types.randomElement()!
        self.defense = 0 + gameInfo.player.level
        if gameInfo.player.level >= 10 {
            self.defense = 10
        }
        self.type = "Head"
    }
}

class chest: armor {
    init() {
        super.init(type: "Chest")
        let types = ["Graphic Tee Shirt", "Tanktop", "Turtle Neck", "Sports Jersey"]
        self.name = types.randomElement()!
        self.defense = 1 + gameInfo.player.level
        if gameInfo.player.level >= 10 {
            self.defense = 10
        }
        self.type = "Chest"
    }
}

class hands: armor {
    init() {
        super.init(type: "Gloves")
        let types = ["Oven Mitts", "A Ring", "A Baseball Glove", "Gloves"]
        self.name = types.randomElement()!
        self.defense = 0 + gameInfo.player.level
        if gameInfo.player.level >= 10 {
            self.defense = 10
        }
        self.type = "Hands"
    }
}

class legs: armor {
    init() {
        super.init(type: "Pants")
        let types = ["Shorts", "Jeans", "Sweat Pants", "Bell Bottoms"]
        self.name = types.randomElement()!
        self.defense = 1 + gameInfo.player.level
        if gameInfo.player.level >= 10 {
            self.defense = 10
        }
        self.type = "Legs"
    }
}

class feet: armor {
     init() {
        super.init(type: "Shoes")
        let types = ["Tennis Shoes", "Flip Flops", "Dress Shoes", "Hiking Boots"]
        self.name = types.randomElement()!
        self.defense = 0 + gameInfo.player.level
        if gameInfo.player.level >= 10 {
            self.defense = 10
        }
        self.type = "Feet"
    }
}

class dogCollar: item {
    var color: String
    init() {
        let colors = ["Red", "White", "Blue", "Green", "Yellow", "Black", "Orange", "Gold"]
        self.color = colors.randomElement()!
        super.init(type: "Dog")
        self.name = "Dog Collar"
    }
}
class key: item {
    init() {
        super.init(type: "Key Item")
        self.name = "A Key"
    }
    func openDoor () {
        print("used key to open door")
        //add real code later
    }
}
