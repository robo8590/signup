//
//  US1S13WebsiteIsInvalidUITests.swift
//  SignUpSampleUITests
//
//  Created by Nam Tran on 12/5/21.
//

import XCTest

class US1S13WebsiteIsInvalidUITests: US1SignUpXCTestCase {
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
        websiteField.typeText("abc")

        // Then
        let errorMessage = "The website is invalid."
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, errorMessage)
        XCTAssertFalse(nextButton.isEnabled)

        // When
        websiteField.clearText()
        websiteField.typeText("http://")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, errorMessage)
        XCTAssertFalse(nextButton.isEnabled)

        // When
        websiteField.clearText()
        websiteField.typeText("www.linkedin.com")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, errorMessage)
        XCTAssertFalse(nextButton.isEnabled)

        // When
        websiteField.clearText()
        websiteField.typeText("http://www.linkedin.com/in/robo8590")

        // Then
        XCTAssertFalse(errorLabel.exists)
        XCTAssertTrue(nextButton.isEnabled)
    }
}
