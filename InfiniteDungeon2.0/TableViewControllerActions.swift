//
//  TableViewControllerActions.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 6/13/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import UIKit


class TableViewControllerActions: UITableViewController {
    
    var target = character()
    var enemies = [character]()
    var allParty = [character]()
    var helper = 0
    var desc = "such empty"
    var isFriend = true
    var loop = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gameInfo.text = ""
        for i in gameInfo.player.actions {
            if i == "recruit" && self.isFriend == true {
                gameInfo.player.actions.remove(at: loop)
                self.tableView.reloadData()
            }
            loop += 1
        }
        loop = 0
         if gameInfo.player.partyLim <= gameInfo.party.count {
            for i in gameInfo.player.actions{
                if i == "recruit" {
                    gameInfo.player.actions.remove(at: loop)
                }
                loop += 1
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gameInfo.player.actions.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "actions", for: indexPath) as! TableViewCellActions
        cell.actionChoice.text = gameInfo.player.actions[indexPath.row]
           // Configure the cell...

           return cell
       }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gameInfo.player.action(move: gameInfo.player.actions[indexPath.row], target: target, helper: helper)
        if gameInfo.enemies.count >= 1 {
        auto_battle(friends: gameInfo.party, enemies: gameInfo.enemies)
        }
        performSegue(withIdentifier: "backToFight", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToFight" {
            if let nextVC = segue.destination as? ViewControllerFight {
                nextVC.enemies = gameInfo.enemies
            }
        }
        if segue.identifier == "cancel" {
            if let nextVC = segue.destination as? ViewControllerFight {
                nextVC.enemies = self.enemies
            }
        }
    }
  
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
