//
//  OutputAdapter.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import Foundation

class OutputAdapter: OutputProtocol {
    
    static let shared = OutputAdapter()
    
    var display: DisplayController?
    
 
    
    func output(value: String) {
        display?.showValue(value: value)
        
    }
    
    
}
