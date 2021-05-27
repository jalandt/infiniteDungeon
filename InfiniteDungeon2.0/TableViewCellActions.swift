//
//  TableViewCellActions.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 6/17/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import UIKit

class TableViewCellActions: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var actionChoice: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
