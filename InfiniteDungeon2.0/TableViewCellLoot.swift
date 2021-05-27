//
//  TableViewCellLoot.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 7/15/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import UIKit

class TableViewCellLoot: UITableViewCell {

    var tapTake: ((UITableViewCell) -> Void)?
    var tapTakeAll: ((UITableViewCell) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func TakeAll(_ sender: Any) {
        tapTakeAll?(self)
        print("Take All")
        for i in gameInfo.player.items {
            print(i)
        }
    }
    @IBAction func Take(_ sender: Any) {
        tapTake?(self)
        for i in gameInfo.player.items {
            print(i)
        }
        print("Take")
    }
    @IBOutlet weak var name: UILabel!
}
