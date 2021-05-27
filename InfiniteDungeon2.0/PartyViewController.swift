//
//  PartyViewController.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 7/26/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import UIKit

class PartyViewController: UIViewController {
    var target = character()
    var to = " "

    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = target.name
        self.type.text = target.type
        self.health.text = "Health: \(target.health)/\(target.maxHealth)"
        self.strength.text = "Strength: \(target.strength)"
        self.magic.text = "Magic: \(target.magic)"
        self.intellect.text = "Intellect: \(target.intellect)"
        self.agility.text = "Agility: \(target.agility)"
        self.defense.text = "Defense: \(target.defense)"
        self.charisma.text = "Charisma: \(target.charisma)"
        self.exp.text = "XP: \(target.exp)"
        self.nxtLvl.text = "To next Level: \(target.exp - (15 + ((target.level-1)*15)))"
        self.level.text = "Level: \(target.level)"
        self.head.text = "Head: \(target.hat?.color ?? "Grey") \(target.hat?.name ?? "n/a") Defense: \(target.hat?.defense ?? 0)"
        if target.type == "Human" {
            let t = target as! human
            self.hands.text = "Hands: \(t.gloves?.color ?? "Grey") \(t.gloves?.name ?? "n/a") Defense: \(t.gloves?.defense ?? 0)"
            self.chest.text = "Chest: \(t.shirt?.color ?? "Grey") \(t.shirt?.name ?? "n/a") Defense: \(t.shirt?.defense ?? 0)"
            self.legs.text = "Legs: \(t.pants?.color ?? "Grey") \(t.pants?.name ?? "n/a") Defense: \(t.pants?.defense ?? 0)"
            self.feet.text = "Feet: \(t.shoes?.color ?? "Grey") \(t.shoes?.name ?? "n/a") Defense: \(t.shoes?.defense ?? 0)"
            self.weapon.text = "Weapon: \(t.tool?.name ?? "n/a") Str: \(t.tool?.damage ?? 0) Mag: \(t.tool?.magic ?? 0)"
        } else {
            self.hands.text = "Hands: n/a"
            self.chest.text = "Chest: n/a"
            self.legs.text = "Legs: n/a"
            self.feet.text = "Feet: n/a"
            self.weapon.text = "Weapon: n/a"
        }
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var type: UILabel!
    
    @IBOutlet weak var health: UILabel!
    @IBOutlet weak var strength: UILabel!
    
    @IBOutlet weak var magic: UILabel!
    
    @IBOutlet weak var intellect: UILabel!
    
    @IBOutlet weak var agility: UILabel!
    @IBOutlet weak var defense: UILabel!
    @IBOutlet weak var charisma: UILabel!
    
    @IBOutlet weak var exp: UILabel!
    
    @IBOutlet weak var nxtLvl: UILabel!
    @IBOutlet weak var head: UILabel!
    
    @IBOutlet weak var chest: UILabel!
    
    @IBOutlet weak var hands: UILabel!
    @IBOutlet weak var legs: UILabel!
    
    @IBOutlet weak var feet: UILabel!
    
    @IBOutlet weak var weapon: UILabel!
    
    @IBOutlet weak var level: UILabel!
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    

}
