//
//  Protocols.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import Foundation

protocol InputProtocol {
    func enterNum(_ number: Int)
    func enterUtility(_ symbol: String)
}

protocol OutputProtocol {
    func presentResult(_ result: String)
}

protocol Model {
    func enterEquation(_ equation: String)
}

