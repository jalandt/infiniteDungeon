//
//  TableViewControllerLoot.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 7/15/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import UIKit

class TableViewControllerLoot: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if gameInfo.loot.count == 0 {
            gameInfo.room.chest = false
            performSegue(withIdentifier: "BackToRoom", sender: self)
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
        return gameInfo.loot.count
    }


    @IBAction func Leave(_ sender: Any) {
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Loot", for: indexPath) as! TableViewCellLoot

        // Configure the cell...
        cell.name.text = gameInfo.loot[indexPath.row].name
        cell.tapTake = { [unowned self] (selectedCell) -> Void in
            gameInfo.player.items.append(gameInfo.loot[indexPath.row])
            gameInfo.text = gameInfo.text + "\nYou picked up \(gameInfo.loot[indexPath.row].name)"
            gameInfo.loot.remove(at: indexPath.row)
            self.tableView.reloadData()
            self.viewDidLoad()
        }
        cell.tapTakeAll = { [unowned self] (selectedCell) -> Void in
            gameInfo.player.items.append(contentsOf: gameInfo.loot)
            gameInfo.text = "\nYou picked up"
            for i in gameInfo.loot {
                gameInfo.text = gameInfo.text + " \(i.name)"
            }
            gameInfo.loot.removeAll()
            self.viewDidLoad()

        }
        
        return cell
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
