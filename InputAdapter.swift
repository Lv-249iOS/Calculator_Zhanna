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
    var calculatingString: String! = "" // moving string
    
    
    
    
    
    func enterNum(_ number: Int) {
        if calculatingString == nil || calculatingString == "0" {
            calculatingString = String(number)
        } else {
            calculatingString = calculatingString + "\(number)"
            brain.enterEquation(equation: calculatingString)
        }
    }
    
    
    func enterUtility(_ symbol: Int) {
        
        if let operation = Operation(rawValue: symbol) {
            var operationString = ""
            
            switch operation {
            case .pls:
                operationString = " + "
            case .mns:
                operationString = " - "
            case .mul:
                operationString = " × "
            case .div:
                operationString = " ÷ "
            case .pow:
                operationString = " ^ "
            case .sqrt:
                operationString = " √ "
            case .sin:
                operationString = " sin "
            case .cos:
                operationString = " cos "
            case .log:
                operationString = " log "
            case .leftBracket:
                operationString = " ( "
            case .rightBracket:
                operationString = " ) "
            case .pi:
                operationString = " π "
//            case .clear:
//                operationString = " C "
            case .dot:
                operationString = " . "
            case .sign:
                operationString = " ± "
            case .equal:
                brain.process()
            }
            calculatingString = calculatingString + operationString
            if operation != .equal {
                brain.enterEquation(equation: calculatingString)
            }
        } else {
            print("No such operation by tag \(symbol)")
        }
    }
    
    //
    //        if calculatingString == nil || calculatingString = "0" || calculatingString.characters.count == 1 && calculatingString.characters.last == "-" {
    //            calculatingString = "+"
    //        } else if calculatingString.characters.last == ")" || calculatingString.characters.last! => "0" && calculatingString.characters.last! <= "9" {
    //            calculatingString = calculatingString + " +"
    //        } else {
    //            calculatingString.characters.removeLast()
    //            calculatingString = calculatingString + "+"
    //        }
    //
    
    func removeResult () {
        calculatingString  = ""
        brain.clear()
    }

    
    
    
}






