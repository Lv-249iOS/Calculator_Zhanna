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
        if calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = String(number)
            
        } else if calculatingString.characters.last == "." || calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
            calculatingString = calculatingString + "\(number)"
            
        } else if calculatingString.characters.count == 1 && (calculatingString.characters.last == "+" || calculatingString.characters.last == "-") {
            calculatingString = calculatingString + "\(number)"
            
        } else {
            calculatingString = calculatingString + "\(number)"

        }
        brain.enterEquation(equation: calculatingString)
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
            case .clear:
                brain.clear()
                calculatingString = ""
                operationString = ""
            case .dot:
                operationString = "."
            case .sign:
                operationString = " ± "
            case .equal:
                brain.process()
            case .e:
                operationString = " e "
            case .tan:
                operationString = " tan "
            }
            calculatingString = calculatingString + operationString
            if operation != .equal {
                brain.enterEquation(equation: calculatingString)
            }
        } else {
            print("No such operation by tag \(symbol)")
        }
    }
    
    func pressDigit() {
        
    }
    
    func pressPlus() {
        if calculatingString == nil || calculatingString == "0" || calculatingString.characters.count == 1 && calculatingString.characters.last == "-" {
            calculatingString = "+"
            
        } else if calculatingString.characters.last == ")" {
            calculatingString = calculatingString + " +"
            
        } else if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
            calculatingString = calculatingString + " +"
            
        } else {
            calculatingString.characters.removeLast()
            calculatingString = calculatingString + "+"
        }
    }
    
    
    func pressMin() {
        if calculatingString == nil || calculatingString == "0" || calculatingString.characters.count == 1 && calculatingString.characters.last == "+" {
            calculatingString = calculatingString + "-"
        } else if calculatingString.characters.last == ")" {
            calculatingString = calculatingString + " )"
            
        } else if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
            calculatingString = calculatingString + " -"
        } else {
            calculatingString.characters.removeLast()
            calculatingString = calculatingString + "-"
        }
    }
    
    func pressMul() {
        if calculatingString != nil && calculatingString.characters.count > 1 {
            if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
                calculatingString = calculatingString + " ×"
            } else if calculatingString.characters.last == ")" {
                calculatingString = calculatingString + " ×"
            } else {
                calculatingString.characters.removeLast()
                calculatingString = calculatingString + "×"
            }
        }
    }

    func pressDiv() {
        if calculatingString != nil && calculatingString.characters.count > 1 {
            if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
                calculatingString = calculatingString + " ÷"
            } else if calculatingString.characters.last == ")" {
                calculatingString = calculatingString + " ÷"
            } else {
                calculatingString.characters.removeLast()
                calculatingString = calculatingString + "÷"
            }
        }
    }
    
    
    func pressPow() {
        if (calculatingString != nil && calculatingString != "0") && calculatingString.characters.count >= 1 {
            if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
                calculatingString = calculatingString + " ^"
                
            } else if calculatingString.characters.last == ")" {
                calculatingString = calculatingString + " ^"
                
            } else {
                calculatingString.characters.removeLast()
                calculatingString = calculatingString + "^"
            }
        }
    }
    
    func pressSqrt() {
        calculatingString == nil || calculatingString == "0" ? (calculatingString = "√") : (calculatingString = calculatingString + "√")
    }
    
    func pressSin() {
        calculatingString == nil || calculatingString == "0" ? (calculatingString = "sin") : (calculatingString = calculatingString + "sin")
    }
    
    
    func pressCos() {
        calculatingString == nil || calculatingString == "0" ? (calculatingString = "cos") : (calculatingString = calculatingString + "cos")
    }
    
    func pressTan() {
        calculatingString == nil || calculatingString == "0" ? (calculatingString = "tan") : (calculatingString = calculatingString + "tan")
    }
    


    
    
    func pressDot() {
        if calculatingString == nil || calculatingString == "0" {
            calculatingString = "0."
            
        } else if calculatingString.characters.last != "." {
        if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
            calculatingString! += "."
            
        } else {
         calculatingString = calculatingString + "0."
        
        }
    }
    
}
    
    func pressPi() {
        calculatingString == nil || calculatingString == "0" ? (calculatingString = "π") : (calculatingString = calculatingString + "π")
        
    }

    func pressE() {
        calculatingString == nil || calculatingString == "0" ? (calculatingString = "e") : (calculatingString = calculatingString + "e")
        
    }

}
