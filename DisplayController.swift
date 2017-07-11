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
    
    let outputAdapter = OutputAdapter.shared
    
    func presentResult(result: String) {
        displayLabel.text = result
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        outputAdapter.display = self
    }

}

