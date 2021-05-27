//
//  ViewController.swift
//  InfiniteDungeon2.0
//
//  Created by James Alandt on 6/9/20.
//  Copyright © 2020 James Alandt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func newGame(_ sender: Any) {
        gameInfo.player = human()
        gameInfo.player.name = "New Character"
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func loadGame(_ sender: Any) {
    }
}

