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
    
    
    /*func input(number: Int) {
     displayValue += String(number)
     process()
     }
     
     func input (operation: Operation) {
     }
     
     func process() {
     output.output(value: displayValue)
     }*/
    
    
    func enterEquation(_ equation: String) {
        self.equation = equation
        outputAdapter.presentResult(equation)
    }
    
    func calculate() {
        let expr = NSExpression(format: equation)
        clear()
        if let result = expr.expressionValue(with: nil, context: nil) as? Double {
            outputAdapter.presentResult(String(result))
        } else {
            outputAdapter.presentResult("failed")
        }
    }

    func clear() {
        equation = ""
        outputAdapter.presentResult("0")
    }
    
    
}


