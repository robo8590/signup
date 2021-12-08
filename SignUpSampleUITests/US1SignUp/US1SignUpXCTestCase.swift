//
//  US1SignUpXCTestCase.swift
//  SignUpSampleUITests
//
//  Created by Nam Tran on 12/7/21.
//
//  US1 - User story 1 : Sign Up
//
//  As a guest user,
//  I want to create my account
//  so that I can login to the system.
//

import XCTest

// swiftlint:disable implicitly_unwrapped_optional
class US1SignUpXCTestCase: XCTestCase {
    var app: XCUIApplication!
    var titleLabel: XCUIElement!
    var instructionLabel: XCUIElement!
    var firstNameLabel: XCUIElement!
    var firstNameField: XCUIElement!
    var emailLabel: XCUIElement!
    var emailField: XCUIElement!
    var passwordLabel: XCUIElement!
    var passwordField: XCUIElement!
    var nextButton: XCUIElement!
    var errorLabel: XCUIElement!

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
        passwordLabel = app.staticTexts["PasswordLabel"]
        passwordField = app.secureTextFields["PasswordField"]
        nextButton = app.buttons["NextButton"]
        errorLabel = app.staticTexts["ErrorLabel"]
    }
}
