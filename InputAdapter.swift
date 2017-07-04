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
    
    
    func enterUtility(_ symbol: Int) {
        switch symbol {
            case Operation.pls.rawValue : calculatingString = calculatingString + "+"
            case Operation.mns.rawValue: calculatingString = calculatingString + "-"
            case Operation.mul.rawValue: calculatingString = calculatingString + "×"
            case Operation.div.rawValue: calculatingString = calculatingString + "÷"
            case Operation.pow.rawValue: calculatingString = calculatingString + "^"
            case Operation.sqrt.rawValue: calculatingString = calculatingString + "√"
            case Operation.sin.rawValue: calculatingString = calculatingString + "sin"
            case Operation.cos.rawValue: calculatingString = calculatingString + "cos"
            case Operation.log.rawValue: calculatingString = calculatingString + "log"
            case Operation.leftBracket.rawValue: calculatingString = calculatingString + "("
            case Operation.rightBracket.rawValue: calculatingString = calculatingString + ")"
            case Operation.sqrt.rawValue: calculatingString = calculatingString + "√"
            case Operation.pi.rawValue: calculatingString = calculatingString + "π"
            case Operation.equal.rawValue: calculatingString = calculatingString + "="
            case Operation.clear.rawValue: calculatingString = calculatingString + "C"
            case Operation.dot.rawValue: calculatingString = calculatingString + "."
            case Operation.sign.rawValue: calculatingString = calculatingString + "±"
        default:
            print("Invalid input")
        }
  
        if symbol == 10013 {
            calculatingString = brain.equation
            brain.calculate(comletion:{ result in
                calculatingString = result
            })
        } else {
//            calculatingString = calculatingString + String(symbol)
            brain.enterEquation(calculatingString)
        }
            }
    
    
    
    
    func removeResult () {
        calculatingString = ""
        brain.clear()
    }
    
}



