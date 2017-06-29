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
    
    func input(value: Int) {
        
        brain.input(number: value)
    }
    func input(operation: Operation) {
        brain.input(operation: operation)
        
    }

}
