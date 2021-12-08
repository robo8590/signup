//
//  US1S8PasswordIsInvalidTests.swift
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
//  US1-S8 - Scenario 8: The password is invalid.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the password
//  and the password field was focused on
//  and the keyboard was presented
//  when I enter an invalid password
//  then the error message "The password must have 6 to 200 characters, 1 lowercase, 1 uppercase and 1 special character." is showed
//  and the next button are still disabled.
//

import XCTest
@testable import SignUpSample

class US1S8PasswordIsInvalidTests: XCTestCase {
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
        viewModel.password = "nam123"
        viewModel.handlePasswordOnChange()

        // Then
        XCTAssertFalse(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.currentError, SignUpError.passwordIsInvalid)

        // When
        viewModel.password = "Nam123"
        viewModel.handlePasswordOnChange()

        // Then
        XCTAssertFalse(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.currentError, SignUpError.passwordIsInvalid)

        // When
        viewModel.password = "nam12!"
        viewModel.handlePasswordOnChange()

        // Then
        XCTAssertFalse(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.currentError, SignUpError.passwordIsInvalid)
    }
}
