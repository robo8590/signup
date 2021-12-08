//
//  US1S11WebsiteIsOptionalUITests.swift
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
//  US1-S11 - Scenario 11: The website is optional.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the website
//  and the website field was focused on
//  and the keyboard was presented
//  when I don't want to enter the website
//  and I tap to the next button
//  then the term of use should be showed.
//

import XCTest

class US1S11WebsiteIsOptionalUITests: US1SignUpXCTestCase {
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
