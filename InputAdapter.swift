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
    

    
    func enterNum(_number: Int) {
        if calculatingString == nil || calculatingString == "0" {
            calculatingString = String(_number)
        } else {
        calculatingString = calculatingString + "\(_number)"
    
        }
        brain.EnterEquation(equation: calculatingString)
    }
    
    
    func enterUtility(_symbol: String) {
        calculatingString = calculatingString + _symbol
    
        }
    
    func removeResult (resultClear: String) {
        calculatingString = nil
        brain.remove()
    }
    
        /*brain.EnterEquation(equation: calculatingString)*/
        
        
        
    }
   


