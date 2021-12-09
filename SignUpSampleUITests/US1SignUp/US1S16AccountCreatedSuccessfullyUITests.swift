//
//  US1S16AccountCreatedSuccessfullyUITests.swift
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
//  Submitting
//
//  US1-S16 - Scenario 16: The account is created successfully.
//
//  Given I submitted the sign up form
//  and the loading indicator is showing
//  when the app receive successful response
//  then the confirmation view should be showed
//  and the loading indicator is hiding.
//

import XCTest

class US1S16AccountCreatedSuccessfullyUITests: US1SignUpXCTestCase {
    override func setUpWithError() throws {
        var arg = """
        testing{
            "state": 0,
            "delayTime": 1,
            "accounts": {
            }
        }
        """
        arg = arg.replacingOccurrences(of: "\n", with: "")
        arg = arg.replacingOccurrences(of: " ", with: "")
        args = [arg]

        try super.setUpWithError()
    }

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
        XCTAssertTrue(submitButton.waitForExistence(timeout: 2))

        // When
        submitButton.tap()

        // Then
        XCTAssertFalse(titleLabel.exists)
        XCTAssertFalse(submitButton.exists)
        XCTAssertFalse(instructionLabel.exists)
        XCTAssertFalse(termOfUseView.exists)
        XCTAssertFalse(termOfUseTitleLabel.exists)

        // After that
        XCTAssertTrue(confirmViewWelcomeLabel.waitForExistence(timeout: 2))
        XCTAssertEqual(confirmViewWelcomeLabel.label, "Hello, Nam!")
        XCTAssertTrue(confirmViewMessageLabel.exists)
        let message = "Your super-awesome portfolio has been successfully submitted! "
        + "The details below will be public within your community!"
        XCTAssertEqual(confirmViewMessageLabel.label, message)
        XCTAssertTrue(confirmViewWebsiteLink.exists)
        XCTAssertEqual(confirmViewWebsiteLink.label, "http://www.linkedin.com/in/robo8590")
        XCTAssertTrue(confirmViewNameLabel.exists)
        XCTAssertEqual(confirmViewNameLabel.label, "Nam")
        XCTAssertTrue(confirmViewEmailLabel.exists)
        XCTAssertEqual(confirmViewEmailLabel.label, "robo8590@gmail.com")
        XCTAssertTrue(confirmViewLoginButton.exists)
    }
}
