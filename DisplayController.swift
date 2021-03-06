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
    @IBOutlet weak var displayScrollView: UIScrollView!
    
    let outputAdapter = OutputAdapter.shared
    
    // MARK: Presenting result on display
    func presentResult(result: String) {
        displayLabel.text = result
        
        // MARK: Reloading layout of scroll view to correctly display its position
        displayScrollView.layoutIfNeeded()
        displayScrollView.scrollRectToVisible(displayLabel.bounds, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputAdapter.display = self
    }
}

