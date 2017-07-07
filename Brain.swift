//
//  Brain.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import Foundation

class Brain: Model {
    static let shared = Brain()
    let outputAdapter = OutputAdapter.shared
    var equation: String!
    
    func enterEquation(equation: String) {
        self.equation = equation
        outputAdapter.presentResult(result: equation)
    }
    
    
    func clear() {
        equation = ""
        outputAdapter.presentResult(result: "0")
    }

    
    
    
    func presentCalculatingString() {
        
    }
    
    
    // MARK: processing equation and sending result to outputAdapter
    func process() {
        let result = calculateEquation()
        outputAdapter.presentResult(result: String(result))
    }
    
    
    
    // MARK: separating String to characters
    func parseInfix(_ equationString: String) -> [String] {
        let tokens = equationString.characters.split{$0 == " "}.map(String.init)
        return tokens
    }
    
    
    
    // MARK: Calculating equation
    func calculateEquation() -> Double {
        let rpnString = reverseToPolishNotation(tokens: parseInfix(equation))
        var stack : [String] = []
        
        for toks in rpnString {
            if Double(toks) != nil {
                stack += [toks]
            } else if toks == "cos" || toks == "sin" || toks == "√" || toks == "ln" {
                let unaryOperation = Double(stack.removeLast())
                
                // MARK: Performing unaryoperations
                switch toks {
                case "cos" : stack += [String(cos(unaryOperation!))]
                case "sin" : stack += [String(sin(unaryOperation!))]
                case "√" : stack += [String(sqrt(unaryOperation!))]
                case "ln" : stack += [String(log(unaryOperation!))]
                default: break
                }
            } else {
                let operandTwo = Double(stack.removeLast())
                let operandOne = Double(stack.removeLast())
                
                // MARK: Performing binaryoperations
                switch toks {
                case "+" : stack += [String(operandOne! + operandTwo!)]
                case "-" : stack += [String(operandOne! - operandTwo!)]
                case "×" : stack += [String(operandOne! * operandTwo!)]
                case "÷" : stack += [String(operandOne! / operandTwo!)]
                default: break
                }
                
            }
        }
        return Double(stack.removeLast())!
    }
    
    func reverseToPolishNotation(tokens: [String]) -> [String] {
        var arrayOfOperands : [String] = [] // Array for equations
        var arrayOfOperations : [String] = [] // Array for operations
        
        
        for token in tokens {
            switch token {
            case "(" : arrayOfOperations += [token]
            case ")" :
                while arrayOfOperations.isEmpty {
                    let operation = arrayOfOperations.removeLast()
                    if operation == "(" {
                        break
                    } else {
                        arrayOfOperands += [operation]
                    }
                }
            default:
                if let firstOperand = operations[token] {
                    for operation in arrayOfOperations.reversed() {
                        if let secondOperand = operations[operation] {
                            if !(firstOperand.prec > secondOperand.prec || (firstOperand.prec == secondOperand.prec && firstOperand.rAssoc)){
                                arrayOfOperands += [arrayOfOperations.removeLast()]
                                continue
                            }
                        }
                        break
                    }
                    arrayOfOperations += [token]
                } else {
                    arrayOfOperands += [token]
                }
            }
        }
        return (arrayOfOperands + arrayOfOperations.reversed()) // lifo (like in stack struct)
    }
    
    
    
    
    // MARK: setting priority of operations
    let operations = [
        "√" : (prec: 5, rAssoc: true),
        "cos" : (prec: 5, rAssoc: true),
        "sin" : (prec: 5, rAssoc: true),
        "ln" : (prec: 4, rAssoc: true),
        "^" : (prec: 4, rAssoc: true),
        "×" : (prec: 3, rAssoc: false),
        "÷" : (prec: 3, rAssoc: false),
        "+" : (prec: 2, rAssoc: false),
        "-" : (prec: 2, rAssoc: false)
    ]
    
    
}

