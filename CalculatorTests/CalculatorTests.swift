//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    
    let input = InputAdapter.shared
    let output = OutputAdapter.shared
    
    var result: String?
    
    override func setUp() {
        super.setUp()
        
        output.display = { [weak self] res in
            self?.result = res
        }
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testNumbers() {
        input.enterUtility(10014)
        input.enterNum(5)
        input.enterNum(9)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "59", "Result must be 59")
    }
    
    func test6BigNumbers() {
        input.enterUtility(10014)
        input.enterNum(123456)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "123456", "Result must be 123456, but \(result) is presented")
    }
    
    func test9BigNumbers() {
        input.enterUtility(10014)
        input.enterNum(123456789)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "123456789", "Result must be 123456789, but \(result) is presented")
    }
    
    func testSimlePlus() {
        input.enterUtility(10014)
        input.enterNum(25)
        input.enterUtility(10001)
        input.enterNum(21)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "46", "Result must be 46, but \(result) is presented")
    }
    
    func testDoublePlus() {
        input.enterUtility(10014)
        input.enterNum(25)
        input.enterUtility(10001)
        input.enterUtility(10001)
        input.enterNum(21)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "46", "Result must be 46, but \(result) is presented")
    }
    
    func testPlusInSequence() {
        input.enterUtility(10014)
        input.enterNum(25)
        input.enterUtility(10001)
        input.enterNum(21)
        input.enterUtility(10013)
        input.enterUtility(10013)
        input.enterUtility(10013)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "88", "Result must be 88, but \(result) is presented")
    }
    
    func testMinus() {
        input.enterUtility(10014)
        input.enterNum(2)
        input.enterUtility(10002)
        input.enterNum(3)
        input.enterUtility(10013)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "-1", "Result must be -1, but \(result) is presented")
    }
    
    func testDoubleOperation() {
        input.enterUtility(10014)
        input.enterNum(2)
        input.enterUtility(10001)
        input.enterUtility(10003)
        input.enterNum(3)
        input.enterUtility(10013)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "6", "Result must be 6, but \(result) is presented")
    }
    
    func testDivByZeroOperation() {
        input.enterUtility(10014)
        input.enterNum(2)
        input.enterUtility(10004)
        input.enterNum(0)
        input.enterUtility(10013)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "inf", "Result must be inf, but \(result) is presented")
    }
    
    func testSequenceOfOperations() {
        input.enterUtility(10014)
        input.enterNum(2)
        input.enterUtility(10001)
        input.enterNum(6)
        input.enterUtility(10003)
        input.enterNum(8)
        input.enterUtility(10004)
        input.enterNum(2)
        input.enterUtility(10002)
        input.enterNum(1)
        input.enterUtility(10013)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "25", "Result must be 25, but \(result) is presented")
    }
    
    
    func testDoubleDiv() {
        input.enterUtility(10014)
        input.enterNum(24)
        input.enterUtility(10004)
        input.enterNum(2)
        input.enterUtility(10004)
        input.enterUtility(3)
        input.enterUtility(10013)
        
        XCTAssertNotNil(result, "Result cant be nil")
        XCTAssert(result == "4", "Result must be -4, but \(result) is presented")
    }
}
    

