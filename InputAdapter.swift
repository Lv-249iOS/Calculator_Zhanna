//
//  InputAdapter.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import Foundation

class InputAdapter: InputProtocol {
    static let shared = InputAdapter()
    let brain = Brain.shared
    var calculatingString:String! = ""
    

    func enterNum(_ number: Int) {
        if calculatingString == nil || calculatingString == "0" {
            calculatingString = String(number)
        } else {
            calculatingString = calculatingString + "\(number)"
            
        }
        brain.enterEquation(calculatingString)
    }
    
    
    func enterUtility(_ symbol: String) {
  
        if symbol == "=" {
            calculatingString = brain.equation
            brain.calculate(comletion:{ result in
                calculatingString = result
            })
        } else {
            calculatingString = calculatingString + symbol
            brain.enterEquation(calculatingString)
        }
    }
    
    func removeResult () {
        calculatingString = ""
        brain.clear()
    }
    
}



