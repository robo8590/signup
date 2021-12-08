//
//  US1S14TermOfUseUITests.swift
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
//  Viewing term of use
//
//  US1-S14 - Scenario 14: Term of use.
//
//  Given I started the sign up wizard
//  when I go to the last step
//  then I am able to view the term of use
//  and the submit button is enable.
//

import XCTest

class US1S14TermOfUseUITests: US1SignUpXCTestCase {
    func testScenario() throws {
        // Given
        firstNameField.typeText("Nam")
        nextButton.tap()
        emailField.typeText("robo8590@gmail.com")
        nextButton.tap()
        passwordField.typeText("Nam123!")
        nextButton.tap()
        websiteField.typeText("http://www.linkedin.com/in/robo8590")
        nextButton.tap()

        // Then
        XCTAssertTrue(titleLabel.exists)
        XCTAssertFalse(instructionLabel.exists)
        XCTAssertFalse(websiteLabel.exists)
        XCTAssertFalse(websiteField.exists)
        XCTAssertFalse(nextButton.exists)
        XCTAssertTrue(termOfUseTitleLabel.exists)
        XCTAssertTrue(termOfUseView.exists)
        XCTAssertTrue(submitButton.exists)
    }
}
