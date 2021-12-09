//
//  US1S15EmailIsAlreadyInUseUITests.swift
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
//  US1-S15 - Scenario 15: The email is already in use.
//
//  Given I submitted the sign up form
//  and the loading indicator is showing
//  when the app receive error about "The email is already in use"
//  then the email field is showed
//  and the error message "The email is already in use" is showed
//  and the loading indicator is hiding.
//

import XCTest

class US1S15EmailIsAlreadyInUseUITests: US1SignUpXCTestCase {
    override func setUpWithError() throws {
        var arg = """
        testing{
            "state": 0,
            "delayTime": 1,
            "accounts": {
                "robo8590@gmail.com": {
                    "firstName": "Nam",
                    "email": "robo8590@gmail.com",
                    "password": "Nam123!",
                    "website": "http://www.linkedin.com/in/robo8590"
                }
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
        XCTAssertTrue(emailField.waitForExistence(timeout: 2))
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, "The email is already in use.")
        XCTAssertTrue(nextButton.exists)
        XCTAssertTrue(nextButton.isEnabled)
    }
}
