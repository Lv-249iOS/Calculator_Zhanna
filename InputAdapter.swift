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
        } else if calculatingString.characters.last! == ")" {
            calculatingString =  calculatingString + " × " + "\(number)"
        } else if calculatingString.characters.last == "." || calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
            calculatingString = calculatingString + "\(number)"
            
        } else if calculatingString.characters.count == 1 && (calculatingString.characters.last == "+" || calculatingString.characters.last == "-") {
            calculatingString = calculatingString + "\(number)"
            
        } else {
            calculatingString = calculatingString + "\(number)"

        }
        
        brain.enterEquation(equation: calculatingString)
    }



    
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
                if calculatingString.characters.count > 0 {
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
    
    
    // MARK: Validation of operations
    func pressPlus() {
        if calculatingString == nil || calculatingString == "0" || calculatingString == "" || (calculatingString.characters.count == 1 && calculatingString.characters.last == "-")  {
            calculatingString = "+"
            
        } else if calculatingString.characters.last == ")" {
            calculatingString = calculatingString + " + "
            
        } else if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
            calculatingString = calculatingString + " + "
            
        } else {
            calculatingString.characters.removeLast()
            calculatingString = calculatingString + "+"
        }
    }
    
    
    func pressMin() {
        if calculatingString == nil || calculatingString == "0" || calculatingString == "" || (calculatingString.characters.count == 1 && calculatingString.characters.last == "+") {
            calculatingString = "-"
        } else if calculatingString.characters.last == ")" {
            calculatingString = calculatingString + " - "
            
        } else if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
            calculatingString = calculatingString + " - "
        } else {
            calculatingString.characters.removeLast()
            calculatingString = calculatingString + " - "
        }
    }
    
    func pressMul() {
        if (calculatingString != nil && calculatingString.characters.count > 0) {
            if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
                calculatingString = calculatingString + " × "
                
            } else if calculatingString.characters.last == ")" {
                calculatingString = calculatingString + " ×"
                
            } else {
                calculatingString.characters.removeLast()
                calculatingString = calculatingString + " × "
            }
        }
    }

    func pressDiv() {
        if calculatingString != nil  && calculatingString.characters.count > 0 {
            if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
                calculatingString = calculatingString + " ÷ "
            } else if calculatingString.characters.last == ")" {
                calculatingString = calculatingString + " ÷"
            } else {
                calculatingString.characters.removeLast()
                calculatingString = calculatingString + " ÷ "
            }
        }
    }
    
    
    func pressPow() {
        if (calculatingString != nil && calculatingString != "0") && calculatingString.characters.count >= 0 {
            if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
                calculatingString = calculatingString + " ^ "
                
            } else if calculatingString.characters.last == ")" {
                calculatingString = calculatingString + " ^"
                
            } else {
                calculatingString.characters.removeLast()
                calculatingString = calculatingString + " ^ "
            }
        }
    }
    
    func pressSqrt() {
        calculatingString == nil || calculatingString == "0" || calculatingString == ""  ? (calculatingString = "√ ") : (calculatingString = calculatingString + "√ ")
    }
    
    func pressSin() {
        calculatingString == nil || calculatingString == "0" ? (calculatingString = " sin ") : (calculatingString = calculatingString + " sin ")
    }
    
    
    func pressCos() {
        calculatingString == nil || calculatingString == "0" ? (calculatingString = " cos ") : (calculatingString = calculatingString + " cos ")
    }
    
    func pressTan() {
        calculatingString == nil || calculatingString == "0" ? (calculatingString = " tan ") : (calculatingString = calculatingString + " tan ")
    }
    
    func pressLog() {
    calculatingString == nil || calculatingString == "0" || calculatingString == "" ? (calculatingString = " log ") : (calculatingString = calculatingString + " log ")
    }
    
    
    func pressLeftBracket() {
        if calculatingString == nil || calculatingString == "0" || calculatingString == "" {
            calculatingString = "( "
        } else if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" || calculatingString.characters.last! == ")"  {
            calculatingString = calculatingString + " × ( "
        } else {
            calculatingString = calculatingString + " ( "
        }
        
    }
    
        
    func pressRightBracket() {
       // calculatingString = calculatingString + ")"
        if calculatingString != nil && calculatingString != "0" && calculatingString != "" {
            if calculatingString.characters.last! >= "0" && calculatingString.characters.last! <= "9" {
                calculatingString = calculatingString + " )"
                
            } else if calculatingString.characters.last! == ")" {
                calculatingString = " × " + calculatingString
                
            } else {
               calculatingString = calculatingString + " )"
            }
        }
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
        calculatingString == nil || calculatingString == "0" || calculatingString == "" ? (calculatingString = String(Double.pi) ) : (calculatingString = calculatingString + String(Double.pi))
        
    }

    func pressE() {
        calculatingString == nil || calculatingString == "0" || calculatingString == "" ? (calculatingString = String(M_E)) : (calculatingString = calculatingString + String(M_E))
        
    }

}
