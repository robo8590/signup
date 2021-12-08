//
//  US1S4EmailIsInvalidTests.swift
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
//  Entering the email
//
//  US1-S4 - Scenario 4: The email is invalid.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the email
//  and the email text field was focused on
//  and the keyboard was presented
//  when I enter an invalid email
//  then the error message "The email is invalid" is showed
//  and the next button are still disabled.
//

import XCTest
@testable import SignUpSample

class US1S4EmailIsInvalidTests: XCTestCase {
    func testViewModel() {
        let viewModel = SignUpViewModel()

        // Given
        viewModel.firstName = "Nam Tran"
        viewModel.currentStep = .enteringEmail
        XCTAssertEqual(viewModel.email, "")
        XCTAssertFalse(viewModel.isCurrentInputValid)

        // When
        viewModel.email = "robo8590"
        viewModel.handleEmailOnChange()

        // Then
        XCTAssertFalse(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.currentError, SignUpError.emailIsInvalid)

        // When
        viewModel.email = "robo8590@gmail"
        viewModel.handleEmailOnChange()

        // Then
        XCTAssertFalse(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.currentError, SignUpError.emailIsInvalid)

        // When
        viewModel.email = "robo$8590@gmail.com"
        viewModel.handleEmailOnChange()

        // Then
        XCTAssertFalse(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.currentError, SignUpError.emailIsInvalid)

        // When
        viewModel.email = "robo%8-5+9.0@gm*ail.com"
        viewModel.handleEmailOnChange()

        // Then
        XCTAssertFalse(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.currentError, SignUpError.emailIsInvalid)

        // When
        viewModel.email = "robo%8-5+9.0@gm.ai-9l.c"
        viewModel.handleEmailOnChange()

        // Then
        XCTAssertFalse(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.currentError, SignUpError.emailIsInvalid)

        // When
        viewModel.email = "robo%8-5+9.0@gm.ai-9l.com3"
        viewModel.handleEmailOnChange()

        // Then
        XCTAssertFalse(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.currentError, SignUpError.emailIsInvalid)
    }
}
