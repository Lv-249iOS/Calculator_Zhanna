//
//  Protocols.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import Foundation

 enum Operation {
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
]


protocol InputAdapter {
    func enter(value: String)
}

protocol OutputAdapter {
    func output(value: String)
}

protocol Model {
    func input(number: Double)
    func input (operation: Operation)
}

