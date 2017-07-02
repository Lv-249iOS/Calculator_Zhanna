//
//  KeyboardController.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import UIKit

class KeyboardController: UIViewController {
    
    
    var touchedDigit: ((_ digit: Int) -> ())?
    var touchedSymbol: ((_ symbol: String) -> ())?
    var clearedResult: ((_ clearRes: String) -> ())?
    
    @IBAction func touchDigit(button: UIButton) {
        touchedDigit?(button.tag)
    }
    
    @IBAction func touchSymbol (button : UIButton) {
        touchedSymbol?(button.currentTitle!)
        
    }
    @IBAction func clearResult (button: UIButton) {
        clearedResult?(button.currentTitle!)
    }
}


    

