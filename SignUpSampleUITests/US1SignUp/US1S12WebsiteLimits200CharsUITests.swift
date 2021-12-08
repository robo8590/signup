//
//  US1S12WebsiteLimits200CharsUITests.swift
//  SignUpSampleUITests
//
//  Created by Nam Tran on 12/5/21.
//
//
//  US1 - User story 1 : Sign Up
//
//  As a guest user,
//  I want to create my account
//  so that I can login to the system.
//
//  Entering the website
//
//  US1-S12 - Scenario 12: The website limits 200 characters.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the website
//  and the website field was focused on
//  and the keyboard was presented
//  when I enter more than 200 characters
//  then the website name field only accepts 200 characters.
//

import XCTest

class US1S12WebsiteLimits200CharsUITests: US1SignUpXCTestCase {
    func testScenario() throws {
        // Given
        firstNameField.typeText("Nam")
        nextButton.tap()
        emailField.typeText("robo8590@gmail.com")
        nextButton.tap()
        passwordField.typeText("Nam123!")
        nextButton.tap()
        XCTAssertTrue(websiteLabel.exists)
        XCTAssertTrue(websiteField.exists)
        XCTAssertEqual(websiteField.value as? String, "")
        XCTAssertEqual(websiteField.value(forKey: "hasKeyboardFocus") as? Bool, true)
        XCTAssertTrue(nextButton.exists)
        XCTAssertTrue(nextButton.isEnabled)

        // When
        let input = "http://www.linkedin.com/in/robo8590/NamTranNamTranNamTranNamTranNamTran"
        + "NamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTran"
        + "NamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTranNamTran"
        websiteField.typeText(input)

        // Then
        XCTAssertEqual(websiteField.value as? String, String(input.prefix(200)))
        XCTAssertTrue(nextButton.isEnabled)
    }
}
