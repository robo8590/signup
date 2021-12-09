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
    var args = ["testing"]
    var app: XCUIApplication!
    var titleLabel: XCUIElement!
    var instructionLabel: XCUIElement!
    var firstNameLabel: XCUIElement!
    var firstNameField: XCUIElement!
    var emailLabel: XCUIElement!
    var emailField: XCUIElement!
    var passwordLabel: XCUIElement!
    var passwordField: XCUIElement!
    var websiteLabel: XCUIElement!
    var websiteField: XCUIElement!
    var termOfUseTitleLabel: XCUIElement!
    var termOfUseView: XCUIElement!
    var nextButton: XCUIElement!
    var submitButton: XCUIElement!
    var errorLabel: XCUIElement!
    var progressView: XCUIElement!
    var confirmViewLoginButton: XCUIElement!
    var confirmViewWelcomeLabel: XCUIElement!
    var confirmViewMessageLabel: XCUIElement!
    var confirmViewEmailLabel: XCUIElement!
    var confirmViewNameLabel: XCUIElement!
    var confirmViewWebsiteLink: XCUIElement!

    override func setUpWithError() throws {
        try super.setUpWithError()

        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments = args
        app.launch()

        titleLabel = app.staticTexts["SignUpView.TitleLabel"]
        instructionLabel = app.staticTexts["SignUpView.InstructionLabel"]
        firstNameLabel = app.staticTexts["SignUpView.FirstNameLabel"]
        firstNameField = app.textFields["SignUpView.FirstNameField"]
        emailLabel = app.staticTexts["SignUpView.EmailLabel"]
        emailField = app.textFields["SignUpView.EmailField"]
        passwordLabel = app.staticTexts["SignUpView.PasswordLabel"]
        passwordField = app.secureTextFields["SignUpView.PasswordField"]
        websiteLabel = app.staticTexts["SignUpView.WebsiteLabel"]
        websiteField = app.textFields["SignUpView.WebsiteField"]
        termOfUseTitleLabel = app.staticTexts["SignUpView.TermOfUseTitleLabel"]
        termOfUseView = app.staticTexts["SignUpView.TermOfUseView"]
        nextButton = app.buttons["SignUpView.NextButton"]
        submitButton = app.buttons["SignUpView.SubmitButton"]
        errorLabel = app.staticTexts["SignUpView.ErrorLabel"]
        progressView = app.otherElements["SignUpView.ProgressView"]
        confirmViewLoginButton = app.buttons["SignUpConfirmationView.LoginButton"]
        confirmViewWelcomeLabel = app.staticTexts["SignUpConfirmationView.WelcomeLabel"]
        confirmViewEmailLabel = app.staticTexts["SignUpConfirmationView.EmailLabel"]
        confirmViewNameLabel = app.staticTexts["SignUpConfirmationView.NameLabel"]
        confirmViewWebsiteLink = app.buttons["SignUpConfirmationView.WebsiteLinkButton"]
        confirmViewMessageLabel = app.staticTexts["SignUpConfirmationView.MessageLabel"]
    }
}
