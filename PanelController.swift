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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rainfOfPurpleStars()
    }
    
    // MARK: Navigation of DisplayController and KeyboardController
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
            
        }
    }
    
    func touchDigit(digit: Int) {
        inputAdapter.enterNum(digit)
    }
    
    func touchSymbol(symbol: Int) {
        let operation = Operation(rawValue: symbol)
        inputAdapter.enterUtility(operation!)
        
    }
    func rainfOfPurpleStars() {
        let emitter = Emitter.get(with: #imageLiteral(resourceName: "purplestar"))
        emitter.emitterPosition = CGPoint(x: view.frame.width / 2, y: 0)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        view.layer.addSublayer(emitter)
    }

    
    
}

