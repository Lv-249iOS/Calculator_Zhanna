//
//  Protocols.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import Foundation

 /*enum Operation {
    case constant(Double)
    case unaryOperation((Double) -> Double)
    case binaryOperation ((Double, Double) -> Double)
    case equals
}

private var operations: Dictionary <String, Operation> = [
    "π" : Operation.constant(Double.pi),
    "e" : Operation.constant(M_E),
    "√" : Operation.unaryOperation(sqrt),
    "cos" : Operation.unaryOperation(cos),
    "±" : Operation.unaryOperation({-$0}),
    "×" : Operation.binaryOperation({ $0 * $1 }),
    "÷" : Operation.binaryOperation({ $0 / $1 }),
    "+" : Operation.binaryOperation({ $0 + $1 }),
    "−" : Operation.binaryOperation({ $0 - $1 }),
    "=" : Operation.equals
] */


protocol InputProtocol {
    func enterNum(_number: Int)
    func enterUtility(_symbol: String)
}

protocol OutputProtocol {
    func presentResult(result: String)
}

protocol Model {
    func EnterEquation(equation: String)
    
}

