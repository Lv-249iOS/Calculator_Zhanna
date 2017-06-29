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
    
    var displayValue: String = ""
    
    let output = OutputAdapter.shared
    
    func input(number: Int) {
       displayValue += String(number)
     process()
    }
    func input (operation: Operation) {
    }
    
    func process() {
        output.output(value: displayValue)
    }

}
