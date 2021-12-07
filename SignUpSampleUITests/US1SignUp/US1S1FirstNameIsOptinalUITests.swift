//
//  US1S1FirstNameIsOptinalUITests.swift
//  SignUpSampleUITests
//
//  Created by Nam Tran on 12/5/21.
//
//  US1 - User story 1 : Sign Up
//
//  As a guest user,
//  I want to create my account
//  so that I can login to the system.
//
//  Entering the first name
//
//  US1-S1 - Scenario 1: The first name is optional.
//
//  Given I started the sign up wizard
//  and I tapped to the first name text field
//  and the keyboard was presented
//  when I don't want to enter the first name
//  and I tap to the next button
//  then the email text field should be showed.
//

import XCTest

// swiftlint:disable implicitly_unwrapped_optional
class US1S1FirstNameIsOptinalUITests: XCTestCase {
    var app: XCUIApplication!
    var titleLabel: XCUIElement!
    var instructionLabel: XCUIElement!
    var firstNameLabel: XCUIElement!
    var firstNameField: XCUIElement!
    var emailLabel: XCUIElement!
    var emailField: XCUIElement!
    var nextButton: XCUIElement!

    override func setUpWithError() throws {
        try super.setUpWithError()

        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()

        titleLabel = app.staticTexts["TitleLabel"]
        instructionLabel = app.staticTexts["InstructionLabel"]
        firstNameLabel = app.staticTexts["FirstNameLabel"]
        firstNameField = app.textFields["FirstNameField"]
        emailLabel = app.staticTexts["EmailLabel"]
        emailField = app.textFields["EmailField"]
        nextButton = app.buttons["NextButton"]
    }

    func testScenario() throws {
        // Given
        XCTAssertTrue(titleLabel.exists)
        XCTAssertTrue(instructionLabel.exists)
        XCTAssertTrue(firstNameLabel.exists)
        XCTAssertTrue(firstNameField.exists)
        XCTAssertEqual(firstNameField.value(forKey: "hasKeyboardFocus") as? Bool, true)
        XCTAssertTrue(nextButton.exists)
        XCTAssertTrue(nextButton.isEnabled)

        // When
        nextButton.tap()

        // then the email text field should be showed
        XCTAssertFalse(firstNameLabel.exists)
        XCTAssertFalse(firstNameField.exists)
        XCTAssertTrue(emailLabel.exists)
        XCTAssertTrue(emailField.exists)
        XCTAssertEqual(emailField.value(forKey: "hasKeyboardFocus") as? Bool, true)
        XCTAssertTrue(nextButton.exists)
        XCTAssertFalse(nextButton.isEnabled)
    }
}
