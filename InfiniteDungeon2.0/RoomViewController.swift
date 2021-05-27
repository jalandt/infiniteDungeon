//
//  RoomViewController.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 6/12/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import UIKit

class RoomViewController: UIViewController {
    var party = [character]()
    var room = gameInfo.room
    var to =  " "

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        if gameInfo.room.newRoom == true {
            room = Room(x: gameInfo.player.xloc, y: gameInfo.player.yloc)
            gameInfo.text = "\(gameInfo.player.xloc), \(gameInfo.player.yloc)"
            gameInfo.room = room
            if gameInfo.loot.count >= 1 {
                lt.isEnabled = true
                gameInfo.text = gameInfo.text + "\nYou see "
                for i in gameInfo.loot {
                    gameInfo.text = gameInfo.text + "\(i.name) "
                }
            }
            if gameInfo.room.enemy == true {
                gameInfo.enemies = create_enemies()
                fght.isEnabled = true
            } else {
                gameInfo.enemies.removeAll()
            }
        }
        if gameInfo.loot.count < 1 {
            lt.isEnabled = false
        }
        if gameInfo.enemies.count < 1 {
            fght.isEnabled = false
        }
        gameInfo.player.levelUp()
        for i in gameInfo.party {
            i.levelUp()
        }
        wst.isEnabled = true
        north.isEnabled = true
        south.isEnabled = true
        est.isEnabled = true
        
        dialogue.text = gameInfo.text
        
        /* Available directions to travel */
        if room.eExit == false {
            est.isEnabled = false
        }
        if room.wExit == false {
            wst.isEnabled = false
        }
        if room.nExit == false {
            north.isEnabled = false
        }
        if room.sExit == false {
            south.isEnabled = false
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var dialogue: UITextView!
    
    @IBOutlet weak var north: UIButton!
    @IBAction func up(_ sender: Any) {
        gameInfo.player.yloc += 1
        gameInfo.room.newRoom = true
        viewDidLoad()
    }
    
    @IBOutlet weak var wst: UIButton!
    @IBAction func west(_ sender: Any) {
        gameInfo.player.xloc -= 1
        gameInfo.room.newRoom = true
        viewDidLoad()
    }
    
    @IBOutlet weak var south: UIButton!
    @IBAction func down(_ sender: Any) {
        gameInfo.player.yloc -= 1
        gameInfo.room.newRoom = true
        viewDidLoad()
    }
    
   
    @IBOutlet weak var est: UIButton!
    @IBAction func east(_ sender: Any) {
        gameInfo.player.xloc += 1
        gameInfo.room.newRoom = true
        viewDidLoad()
    }
    
    @IBOutlet weak var fght: UIButton!
    @IBAction func fight(_ sender: Any) {
    }
    
    @IBOutlet weak var lt: UIButton!
    @IBAction func loot(_ sender: Any) {
    }
    
    @IBAction func items(_ sender: Any) {
        performSegue(withIdentifier: "toItemsFromParty", sender: self)
    }
    @IBAction func party(_ sender: Any) {
        performSegue(withIdentifier: "toParty", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toParty" {
            if let nextVC = segue.destination as? PartyTableViewController {
                nextVC.to = "detail"
            }
        }
        if segue.identifier == "toItemsFromParty" {
            if let nextVC = segue.destination as? PartyTableViewController {
                nextVC.to = "items"
            }
        }
    }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
    

}
