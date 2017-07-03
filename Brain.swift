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
    
    func enterEquation(_ equation: String) {
        self.equation = equation
        outputAdapter.presentResult(equation)
    }
    
    func calculate(comletion: (String)->()) {
        let equationString = equation.replacingOccurrences(of: "^", with: "**")
        let expr = NSExpression(format: equationString)
        clear()
        if let result = expr.expressionValue(with: nil, context: nil) as? Double {
            outputAdapter.presentResult(String(result))
            comletion(String(result))
        } else {
            outputAdapter.presentResult("failed")
            comletion("failed")
        }
    }

    func clear() {
        equation = ""
        outputAdapter.presentResult("0")
    }
    
    
}


