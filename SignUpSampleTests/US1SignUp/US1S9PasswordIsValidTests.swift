//
//  US1S9PasswordIsValidTests.swift
//  SignUpSampleTests
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
//  Entering the password
//
//  US1-S9 - Scenario 9: The password is valid.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the password
//  and the password field was focused on
//  and the keyboard was presented
//  when I enter a valid password
//  then the next and go button are enabled
//  when I tap to the next button
//  then the website field should be showed.
//

import XCTest
@testable import SignUpSample

class US1S9PasswordIsValidTests: XCTestCase {
    func testViewModel() {
        let viewModel = SignUpViewModel()

        // Given
        viewModel.firstName = "Nam"
        viewModel.email = "robo8590@gmail.com"
        viewModel.currentStep = .enteringPassword
        XCTAssertEqual(viewModel.password, "")
        XCTAssertFalse(viewModel.isCurrentInputValid)

        // When
        viewModel.password = "Nam!"
        viewModel.handlePasswordOnChange()

        // Then
        XCTAssertFalse(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.currentError, SignUpError.passwordIsInvalid)

        // When
        viewModel.password = "Nam123!"
        viewModel.handlePasswordOnChange()

        // Then
        XCTAssertTrue(viewModel.isCurrentInputValid)
        XCTAssertNil(viewModel.currentError)

        // When
        viewModel.next()

        // Then
        XCTAssertEqual(viewModel.currentStep, .enteringWebsite)
    }
}
