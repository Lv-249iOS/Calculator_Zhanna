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
    
    
    
    
    // MARK: ENTER NUMBERS(DIGITS):
    func enterNum(_ number: Int) {
        if calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = String(number)
            
        } else if calculatingString.characters.last! == ")" {
            calculatingString =  calculatingString + " × " + "\(number)"
            
        } else if calculatingString.characters.last == "." || (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") || (calculatingString.characters.count == 1 && (calculatingString.characters.last == "+" || calculatingString.characters.last == "-")) {
            calculatingString = calculatingString + "\(number)"
            
        } else if calculatingString.characters.count >= 3, calculatingString.substring(from: calculatingString.index(calculatingString.endIndex, offsetBy: -3)) == "( -" {
            calculatingString = calculatingString + "\(number)"
            
        } else {
            calculatingString = calculatingString + " \(number)"

        }
        
        brain.enterEquation(equation: calculatingString)
    }


    // MARK: ENTER SYMBOLS(OPERATIONS):
    
    func enterUtility(_ symbol: Operation) {
        
        
            switch symbol {
            case .pls:
                pressPlus()
            case .mns:
                 pressMin()
            case .mul:
                 pressMul()
            case .div:
                pressDiv()
            case .pow:
                 pressPow()
            case .sqrt:
                 pressSqrt()
            case .sin:
                pressSin()
            case .cos:
                 pressCos()
            case .log:
                 pressLog()
            case .leftBracket:
               pressLeftBracket()
            case .rightBracket:
                pressRightBracket()
            case .pi:
                pressPi()
            case .clear:
                brain.clear()
                calculatingString = ""
                calculatingString = calculatingString + ""
            case .dot:
                 pressDot()
            case .sign:
                calculatingString = calculatingString + " ± "
            case .equal:
                if pressEqual() {
                    brain.process()
                }
            case .e:
                pressE()
            case .tan:
                pressTan()
            }
            if symbol != .equal {
                brain.enterEquation(equation: calculatingString)
            }
       
        }
    
    
    
    
    // MARK: Checking Plus
    func pressPlus() {
        
        if calculatingString == nil || calculatingString == "0" || calculatingString == "" || (calculatingString.characters.count == 1 && calculatingString.characters.last == "-")  {
            calculatingString = "+"
            
        } else if (calculatingString.characters.last == ")" || calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9")  ||  calculatingString.characters.last! == "." {
            calculatingString = calculatingString + " +"

            
        } else if calculatingString.characters.last != "(" {
            calculatingString.characters.removeLast()
            calculatingString = calculatingString + "+"
        }
    }
    


    // MARK: Checking Minus
    func pressMin() {
        if calculatingString == nil || calculatingString == "0" || calculatingString == "" || (calculatingString.characters.count == 1 && calculatingString.characters.last == "+") {
            calculatingString = "-"
            
        } else if (calculatingString.characters.last == ")" || calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") || calculatingString.characters.last! == "." || calculatingString.characters.last == "("  {
            calculatingString = calculatingString + " -"
            
        
        } else  if calculatingString.characters.last != "(" {
        calculatingString.characters.removeLast()
            calculatingString = calculatingString + "-"
        }
    }
    
    
    // MARK: Checking Multiply
    func pressMul() {
        if (calculatingString != nil && calculatingString.characters.count > 0) {
            if (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") || (calculatingString.characters.last == ")") || calculatingString.characters.last! == "." {
                calculatingString = calculatingString + " ×"
                
            } else if calculatingString.characters.last != "(" && calculatingString != "+" && calculatingString != "-" {
                calculatingString.characters.removeLast()
                calculatingString = calculatingString + "×"
            }
        }
    }

    // MARK: Checking Divide
    func pressDiv() {
        if calculatingString != nil  && calculatingString.characters.count > 0 {
            if (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") || (calculatingString.characters.last == ")") || calculatingString.characters.last! == "." {
                calculatingString = calculatingString + " ÷"
            
            } else if calculatingString.characters.last != "(" && calculatingString != "+" && calculatingString != "-" {
                calculatingString.characters.removeLast()
                calculatingString = calculatingString + "÷"
            }
        }
    }
    
    // MARK: Checking PowerTo
    func pressPow() {
        if calculatingString != nil && calculatingString != "0" && calculatingString != "" {
            if (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") || (calculatingString.characters.last == ")") || calculatingString.characters.last! == "." {
                calculatingString = calculatingString + " ^"
                
                
            } else if calculatingString.characters.last != "(" && calculatingString != "+" && calculatingString != "-" {
                calculatingString.characters.removeLast()
                calculatingString = calculatingString + "^"
            }
        }
    }
    
    // MARK: Checking SqureRoot
    func pressSqrt() {
        if calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = "√"
        } else if calculatingString.characters.last! == ")" || (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") {
            calculatingString = calculatingString + " × √"
        } else {
            calculatingString = calculatingString + " √"
        }
    }
    
    
    // MARK: Checking Sinus
    func pressSin() {
        if  calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = "sin "
        } else if calculatingString.characters.last! == ")" || (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") {
            calculatingString = calculatingString + " × sin"
        } else {
            calculatingString = calculatingString + " sin"
        }
    }
    
    
    // MARK: Checking Cosinus
    func pressCos() {
        if  calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = "cos "
        } else if calculatingString.characters.last! == ")" || (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") {
            calculatingString = calculatingString + " × cos"
        } else {
            calculatingString = calculatingString + " cos"
        }
    }

    
    
    // MARK: Checki Tan
    func pressTan() {
        if  calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = "tan "
        } else if calculatingString.characters.last! == ")" || (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") {
            calculatingString = calculatingString + " × tan"
        } else {
            calculatingString = calculatingString + " tan"
        }
    }
    
    // MARK: Checking Log
    func pressLog() {
        if  calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = "log "
        } else if calculatingString.characters.last! == ")" || (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") {
            calculatingString = calculatingString + " × log"
        } else {
            calculatingString = calculatingString + " log"
        }
    }
    
    // MARK: Checking LeftBracket
    func pressLeftBracket() {
        if calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = "("
        } else if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" || calculatingString.characters.last! == ")"  {
            calculatingString = calculatingString + " × ( "
        } else {
            calculatingString = calculatingString + " ("
        }
        
    }
    
    // MARK: Checking RightBracket
    func pressRightBracket() {
        if (calculatingString != nil && calculatingString != "0" && calculatingString != "") && calculatingString.characters.last != "(" {
            if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
                calculatingString = calculatingString + " )"
                
            } else {
               calculatingString = calculatingString + " )"
            }
        }
    }
    
    
    // MARK: Checking Equal
    func pressEqual() -> Bool {
        if (calculatingString != nil && calculatingString != "0" && calculatingString != "") &&
            ((calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9"))  ||
            calculatingString.characters.last == ")" {
            return true
        } else {
            return false
        }
    }
    
    
    // MARK: Checking Dot
    func pressDot() {
        if calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = "0."
            
        } else if calculatingString.characters.last != "." {
            
        if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
            calculatingString! += "."
            
        } else if calculatingString.characters.last == "(" {
         calculatingString = calculatingString + "0."
        
        }
    }
    
}
    // MARK: Checking constatnt Pi
    func pressPi() {
        if  calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = "\(Double.pi)"
            
        } else if calculatingString.characters.last! == ")" || (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") {
            calculatingString = calculatingString + " × \(Double.pi)"
            
        } else if  (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") || (calculatingString.characters.count == 1 && calculatingString.characters.last == "-") {
            calculatingString = calculatingString + "\(Double.pi)"
            
        } else if calculatingString.characters.count >= 3, calculatingString.substring(from: calculatingString.index(calculatingString.endIndex, offsetBy: -3)) == "( -" {
                calculatingString = calculatingString + "\(Double.pi)"

            
        } else {
            calculatingString = calculatingString + " \(Double.pi)"
        }
    }


    // MARK: Checking constant E
    func pressE() {
        if  calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = "\(M_E)"
            
        } else if calculatingString.characters.last! == ")" || (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") {
            calculatingString = calculatingString + " × \(M_E)"
            
        } else if  (calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9") || (calculatingString.characters.count == 1 && calculatingString.characters.last == "-") {
            calculatingString = calculatingString + "\(M_E)"
            
        } else if calculatingString.characters.count >= 3, calculatingString.substring(from: calculatingString.index(calculatingString.endIndex, offsetBy: -3)) == "( -" {
            calculatingString = calculatingString + "\(M_E)"
        
            
        } else {
            calculatingString = calculatingString + " \(M_E)"
        }
    }

}

