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
    let inputAdapter = InputAdapter.shared
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier  == "DisplayControllerSeque",
            let controller = segue.destination as? DisplayController {
            display = controller
        } else if segue.identifier  == "KeyboardControllerSeque",
            let controller = segue.destination as? KeyboardController {
            
            keyboard = controller
            keyboard.touchedDigit = { [weak self] digit in
                self?.touchDigit(digit: digit)
            }
            
            keyboard.touchedSymbol = { [weak self] symbol in
                self?.touchSymbol(symbol: symbol)
            }
            
            
            keyboard.clearedResult = { [weak self] clearRes in
                self?.clearResult()
            }
            
        }
        
    }
    func touchDigit(digit: Int) {
        inputAdapter.enterNum(digit)
    }
    
    func touchSymbol(symbol: Int) {
        inputAdapter.enterUtility(symbol)
    }
    func clearResult() {
        inputAdapter.removeResult()
    }
    
}
