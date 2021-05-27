//
//  ViewControllerCharacterCreation.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 6/11/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import UIKit



class ViewControllerCharacterCreation: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = gameInfo.player.name
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var name: UITextField!

    @IBOutlet weak var a: UIButton!
    @IBAction func ath(_ sender: Any) {
        a.isEnabled = false
        gameInfo.player.isAthletic = true
        a.isHighlighted = false
        a.isSelected = false
        n.isSelected = false
        gameInfo.player.isNerdy = false
        n.isEnabled = true
        a.backgroundColor = UIColor.blue
        n.backgroundColor = UIColor.white
        gameInfo.player.strength = 13
        gameInfo.player.intellect = 10
        }
    
    @IBOutlet weak var n: UIButton!
    @IBAction func nrd(_ sender: Any) {
        n.isEnabled = false
        gameInfo.player.isNerdy = true
        gameInfo.player.isAthletic = false
        n.isSelected = false
        a.isSelected = false
        a.isEnabled = true
        n.backgroundColor = UIColor.blue
        a.backgroundColor = UIColor.white
        n.isHighlighted = false
        gameInfo.player.intellect = 13
        gameInfo.player.strength = 10
    }
    
    @IBOutlet weak var natu: UIButton!
    @IBAction func nat(_ sender: Any) {
        natu.isEnabled = false
        gameInfo.player.isNature = true
        natu.isHighlighted = false
        natu.isSelected = false
        t.isSelected = false
        gameInfo.player.isTechy = false
        t.isEnabled = true
        natu.backgroundColor = UIColor.blue
        t.backgroundColor = UIColor.white
        gameInfo.player.will = 13
    }
    
    @IBOutlet weak var s: UIButton!
    @IBAction func sci(_ sender: Any) {
        s.isEnabled = false
        gameInfo.player.isScience = true
        s.isHighlighted = false
        t.isSelected = false
        sp.isSelected = false
        gameInfo.player.isSpiritual = false
        sp.isEnabled = true
        s.backgroundColor = UIColor.blue
        sp.backgroundColor = UIColor.white
        gameInfo.player.will = 10
        // ADD FEATURE FOR STAT BONUS
    }
    
    @IBOutlet weak var t: UIButton!
    @IBAction func tech(_ sender: Any) {
        t.isEnabled = false
        gameInfo.player.isTechy = true
        t.isHighlighted = false
        t.isSelected = false
        natu.isSelected = false
        gameInfo.player.isNature = false
        natu.isEnabled = true
        t.backgroundColor = UIColor.blue
        natu.backgroundColor = UIColor.white
        gameInfo.player.maxHealth = 100
        gameInfo.player.health = gameInfo.player.maxHealth
        // ADD FEATURE FOR STAT BONUS
    }
    
    
    @IBOutlet weak var prc: UIButton!
    @IBAction func prac(_ sender: Any) {
        prc.isEnabled = false
        gameInfo.player.isPractical = true
        prc.isHighlighted = false
        prc.isSelected = false
        crt.isSelected = false
        gameInfo.player.isCreative = false
        crt.isEnabled = true
        prc.backgroundColor = UIColor.blue
        crt.backgroundColor = UIColor.white
        gameInfo.player.maxHealth = 120
        gameInfo.player.health = gameInfo.player.maxHealth
    }
    
    @IBOutlet weak var crt: UIButton!
    @IBAction func creat(_ sender: Any) {
        crt.isEnabled = false
        gameInfo.player.isCreative = true
        crt.isHighlighted = false
        crt.isSelected = false
        prc.isSelected = false
        gameInfo.player.isPractical = false
        prc.isEnabled = true
        crt.backgroundColor = UIColor.blue
        prc.backgroundColor = UIColor.white
        //ADD FEATURE FOR STAT BONUS
    }
    
    @IBOutlet weak var sp: UIButton!
    @IBAction func spir(_ sender: Any) {
        sp.isEnabled = false
        gameInfo.player.isSpiritual = true
        sp.isHighlighted = false
        sp.isSelected = false
        s.isSelected = false
        gameInfo.player.isScience = false
        s.isEnabled = true
        sp.backgroundColor = UIColor.blue
        s.backgroundColor = UIColor.white
        gameInfo.player.magic = 13
    }
    
    @IBOutlet weak var q: UIButton!
    @IBAction func q(_ sender: Any) {
        q.isEnabled = false
        gameInfo.player.isQuiet = true
        q.isHighlighted = false
        q.isSelected = false
        tlk.isSelected = false
        gameInfo.player.isTalkative = false
        tlk.isEnabled = true
        q.backgroundColor = UIColor.blue
        tlk.backgroundColor = UIColor.white
        gameInfo.player.agility = 13
        gameInfo.player.charisma = 10
    }
    
    @IBOutlet weak var tlk: UIButton!
    @IBAction func talk(_ sender: Any) {
        tlk.isEnabled = false
        gameInfo.player.isTalkative = true
        tlk.isHighlighted = false
        tlk.isSelected = false
        q.isSelected = false
        gameInfo.player.isQuiet = false
        q.isEnabled = true
        tlk.backgroundColor = UIColor.blue
        q.backgroundColor = UIColor.white
        gameInfo.player.charisma = 13
        gameInfo.player.agility = 10
    }
    
   
    @IBAction func submit(_ sender: Any) {
        gameInfo.player.name = name.text!
        gameInfo.room.newRoom = true
        gameInfo.party.removeAll()
        gameInfo.player.items.removeAll()
        gameInfo.loot.removeAll()
        gameInfo.enemies.removeAll()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
