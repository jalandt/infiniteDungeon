//
//  TableViewCellEquip.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 7/17/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import UIKit

class TableViewCellEquip: UITableViewCell {

    var equip: ((UITableViewCell) -> Void)?
    var drop: ((UITableViewCell) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var level: UILabel!
    
    @IBAction func equip(_ sender: Any) {
        equip?(self)
    }
    
    @IBAction func drop(_ sender: Any) {
        drop?(self)
    }
    
}
