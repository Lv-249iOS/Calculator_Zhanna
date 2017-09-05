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
    
    // MARK: Sending result to display
    func presentResult(result: String) {
        display?.presentResult(result: result)
    }
}
