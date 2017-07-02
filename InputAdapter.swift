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
    var calculatingString:String!
    
    
    
    func enterNum(_ _number: Int) {
        if calculatingString == nil || calculatingString == "0" {
            calculatingString = String(_number)
        } else {
            calculatingString = calculatingString + "\(_number)"
            
        }
        brain.enterEquation(calculatingString)
    }
    
    
    func enterUtility(_ symbol: String) {
        if symbol == "=" {
            calculatingString = ""
            brain.calculate()
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



