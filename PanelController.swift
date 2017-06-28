//
//  PanelController.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import UIKit

class PanelController: UIViewController {
    
    var display: DisplayController!
    var keyboard: KeyboardController!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier  == "DisplayControllerSeque",
            let controller = segue.destination as? DisplayController {
            display = controller
        } else if segue.identifier  == "KeyboardControllerSeque",
            let controller = segue.destination as? KeyboardController {
            keyboard = controller
        }

    }
}
