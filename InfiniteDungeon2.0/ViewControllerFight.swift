//
//  ViewControllerFight.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 6/13/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import UIKit

class ViewControllerFight: UIViewController {
    var allParty = [character]()
    var enemies = gameInfo.enemies
    var target: character?
    var helper = 0
    var isFriend = false
    var recruit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        for i in gameInfo.player.actions {
            if i == "recruit" {
                self.recruit = true
            }
        }
        if self.recruit == false {
            gameInfo.player.actions.append("recruit")
        }
        allParty = gameInfo.party
        allParty.append(gameInfo.player)
        gameInfo.party = remove_dead(p: gameInfo.party)
        gameInfo.enemies = remove_dead(p: gameInfo.enemies)
        dialogue.text = "There are \(gameInfo.enemies.count) enemies in this room"
        dialogue.text = dialogue.text + gameInfo.text
        uname.setTitle( "\(gameInfo.player.name)", for: .normal)
        uHP.text = "\(gameInfo.player.health)/\(gameInfo.player.maxHealth)"
        p1Name.isHidden = false
        p1Name.isSelected = false
        p2Name.isHidden = false
        p2Name.isSelected = false
        p1HP.isHidden = false
        p2HP.isHidden = false
        e1Name.isSelected = false
        e2Name.isHidden = false
        e2Name.isSelected = false
        e2HP.isHidden = false
        e3Name.isHidden = false
        e3Name.isSelected = false
        e3HP.isHidden = false
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let check = gameInfo.enemies.count
        let checkp = gameInfo.party.count
             switch checkp {
             case 0 :
                 p1Name.isHidden = true
                 p1HP.isHidden = true
                 p2Name.isHidden = true
                 p2HP.isHidden = true
             case 1 :
                 p2Name.isHidden = true
                 p2HP.isHidden = true
                 p1Name.setTitle("\(gameInfo.party[0].name) the \(gameInfo.party[0].type)", for: .normal)
                 p1HP.text = "\(gameInfo.party[0].health)/\(gameInfo.party[0].maxHealth)"
             case 2:
                p1Name.setTitle("\(gameInfo.party[0].name) the \(gameInfo.party[0].type)", for: .normal)
                p1HP.text = "\(gameInfo.party[0].health)/\(gameInfo.party[0].maxHealth)"
                p2Name.setTitle("\(gameInfo.party[1].name) the \(gameInfo.party[1].type)", for: .normal)
                p2HP.text = "\(gameInfo.party[1].health)/\(gameInfo.party[1].maxHealth)"
             default:
                 p1Name.setTitle("\(gameInfo.party[0].name) the \(gameInfo.party[0].type)", for: .normal)
                 p1HP.text = "\(gameInfo.party[0].health)/\(gameInfo.party[0].maxHealth)"
                 p2Name.setTitle("\(gameInfo.party[1].name) the \(gameInfo.party[1].type)", for: .normal)
                 p2HP.text = "\(gameInfo.party[1].health)/\(gameInfo.party[1].maxHealth)"
             
             }
             switch check {
             case 0:
                 gameInfo.room.enemy = false
                 if gameInfo.loot.count > 0 {
                    gameInfo.room.chest = true
                 }
                 gameInfo.room.newRoom = false
                 performSegue(withIdentifier: "toRoom", sender: self)
                 e1Name.isHidden = true
                 e1HP.isHidden = true
                 e2Name.isHidden = true
                 e2HP.isHidden = true
                 e3Name.isHidden = true
                 e3HP.isHidden = true
             case 1:
                e1Name.setTitle("\(gameInfo.enemies[0].name) the \(gameInfo.enemies[0].type)", for: .normal)
                e1HP.text = "\(gameInfo.enemies[0].health)/\(gameInfo.enemies[0].maxHealth)"
                 e2Name.isHidden = true
                 e2HP.isHidden = true
                 e3Name.isHidden = true
                 e3HP.isHidden = true
             case 2:
                e1Name.setTitle("\(gameInfo.enemies[0].name) the \(gameInfo.enemies[0].type)", for: .normal)
                e1HP.text = "\(gameInfo.enemies[0].health)/\(gameInfo.enemies[0].maxHealth)"
                e2Name.setTitle("\(gameInfo.enemies[1].name) the \(gameInfo.enemies[1].type)", for: .normal)
                e2HP.text = "\(gameInfo.enemies[1].health)/\(gameInfo.enemies[1].maxHealth)"
                 e3Name.isHidden = true
                 e3HP.isHidden = true
             case 3:
                e1Name.setTitle("\(gameInfo.enemies[0].name) the \(gameInfo.enemies[0].type)", for: .normal)
                e1HP.text = "\(gameInfo.enemies[0].health)/\(gameInfo.enemies[0].maxHealth)"
                e2Name.setTitle("\(gameInfo.enemies[1].name) the \(gameInfo.enemies[1].type)", for: .normal)
                e2HP.text = "\(gameInfo.enemies[1].health)/\(gameInfo.enemies[1].maxHealth)"
                e3Name.setTitle("\(gameInfo.enemies[2].name) the \(gameInfo.enemies[2].type)", for: .normal)
                e3HP.text = "\(gameInfo.enemies[2].health)/\(gameInfo.enemies[2].maxHealth)"
             default:
                 e1Name.setTitle("\(gameInfo.enemies[0].name) the \(gameInfo.enemies[0].type)", for: .normal)
                 e1HP.text = "\(gameInfo.enemies[0].health)/\(gameInfo.enemies[0].maxHealth)"
                 e2Name.setTitle("\(gameInfo.enemies[1].name) the \(gameInfo.enemies[1].type)", for: .normal)
                 e2HP.text = "\(gameInfo.enemies[1].health)/\(gameInfo.enemies[1].maxHealth)"
                 e3Name.setTitle("\(gameInfo.enemies[2].name) the \(gameInfo.enemies[2].type)", for: .normal)
                 e3HP.text = "\(gameInfo.enemies[2].health)/\(gameInfo.enemies[2].maxHealth)"
             }
             
        if gameInfo.player.health <= 0 {
                 performSegue(withIdentifier: "game over", sender: self)
             }
    }
    
    @IBOutlet weak var dialogue: UITextView!
    @IBOutlet weak var uname: UIButton!
    @IBAction func unameButton(_ sender: Any) {
        target = gameInfo.player
        uname.isSelected = true
        p1Name.isSelected = false
        p2Name.isSelected = false
        e1Name.isSelected = false
        e2Name.isSelected = false
        e3Name.isSelected = false
        self.isFriend = true
    }
    @IBOutlet weak var uHP: UILabel!
    
    @IBOutlet weak var p1Name: UIButton!
    @IBAction func p1NameButton(_ sender: Any) {
        target = gameInfo.party[0]
        uname.isSelected = false
        p1Name.isSelected = true
        p2Name.isSelected = false
        e1Name.isSelected = false
        e2Name.isSelected = false
        e3Name.isSelected = false
        self.isFriend = true
    }
    @IBOutlet weak var p1HP: UILabel!
    
    @IBOutlet weak var p2Name: UIButton!
    @IBAction func p2NameButton(_ sender: Any) {
        target = gameInfo.party[1]
        uname.isSelected = false
        p1Name.isSelected = false
        p2Name.isSelected = true
        e1Name.isSelected = false
        e2Name.isSelected = false
        e3Name.isSelected = false
        self.isFriend = true
    }
    @IBOutlet weak var p2HP: UILabel!
    
    @IBOutlet weak var e1Name: UIButton!
    @IBAction func e1NameButton(_ sender: Any) {
        target = gameInfo.enemies[0]
        helper = 0
        uname.isSelected = false
        p1Name.isSelected = false
        p2Name.isSelected = false
        e1Name.isSelected = true
        e2Name.isSelected = false
        e3Name.isSelected = false
    }
    @IBOutlet weak var e1HP: UILabel!
    
    @IBOutlet weak var e2Name: UIButton!
    @IBAction func e2NameButton(_ sender: Any) {
        target = gameInfo.enemies[1]
        helper = 1
        uname.isSelected = false
        p1Name.isSelected = false
        p2Name.isSelected = false
        e1Name.isSelected = false
        e2Name.isSelected = true
        e3Name.isSelected = false
    }
    @IBOutlet weak var e2HP: UILabel!
    
    @IBOutlet weak var e3Name: UIButton!
    @IBAction func e3NameButton(_ sender: Any) {
        target = gameInfo.enemies[2]
        helper = 2
        uname.isSelected = false
        p1Name.isSelected = false
        p2Name.isSelected = false
        e1Name.isSelected = false
        e2Name.isSelected = false
        e3Name.isSelected = true
    }
    @IBOutlet weak var e3HP: UILabel!
    
    
    @IBAction func Actions(_ sender: Any) {
        if target == nil {
            dialogue.text = dialogue.text + "\nPlease select a target"
        } else {
        performSegue(withIdentifier: "toActions", sender: self)
        }
    }
    @IBAction func items(_ sender: Any) {
        if target == nil {
            dialogue.text = dialogue.text + "\nPlease select a target"
        } else {
            performSegue(withIdentifier: "toItems", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toActions" {
            if let nextVC = segue.destination as? TableViewControllerActions {
                nextVC.target = target!
                nextVC.enemies = gameInfo.enemies
                nextVC.allParty = allParty
                nextVC.helper = helper
                nextVC.isFriend = self.isFriend
            }
        }
        if segue.identifier == "toItems" {
            if let nextVC = segue.destination as? TableViewControllerItems {
                nextVC.target = target
                nextVC.from = "fight"
            }
        }
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
