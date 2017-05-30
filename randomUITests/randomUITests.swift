//
//  randomUITests.swift
//  randomUITests
//
//  Created by Andrew Foster on 5/30/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import XCTest

class randomUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCUIDevice.shared().orientation = .faceUp
        XCUIDevice.shared().orientation = .faceUp
        
        let app = XCUIApplication()
        let generateButton = app.buttons["Generate"]
        generateButton.tap()
        
        let eraseButton = app.buttons["Erase"]
        eraseButton.tap()
        app.buttons["Set Values"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        
        element.children(matching: .textField).element(boundBy: 0).tap()
        app.keys["1"].tap()
        app.keys["2"].tap()
        app.keys["3"].tap()
        
        element.children(matching: .textField).element(boundBy: 1).tap()
        app.keys["9"].tap()
        app.keys["8"].tap()
        app.keys["7"].tap()
        app.buttons["back"].tap()
        generateButton.tap()
        eraseButton.tap()
   
    }
    
}
