//
//  DisplayController.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import UIKit

class DisplayController: UIViewController {

    
    @IBOutlet var displayLabel: UILabel!
    
    let output = OutputAdapter.shared
    
    func showValue(value: String) {
        displayLabel.text = value
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.display = self
    }

}

