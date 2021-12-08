//
//  US1S5EmailIsValidTests.swift
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
//  US1-S5 - Scenario 5: The email is valid.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the email
//  and the email text field was focused on
//  and the keyboard was presented
//  when I enter a valid email
//  then no error message is showed
//  and the next button are enabled
//  when I tap to the next or go button
//  then the password field should be showed.
//

import XCTest
@testable import SignUpSample

class US1S5EmailIsValidTests: XCTestCase {
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
        viewModel.email = "robo%8-5+9.0@gm.ai-9l.co"
        viewModel.handleEmailOnChange()

        // Then
        XCTAssertTrue(viewModel.isCurrentInputValid)
        XCTAssertNil(viewModel.currentError)

        // When
        viewModel.email = "robo8590@gmail.com"
        viewModel.handleEmailOnChange()
        viewModel.next()

        // Then
        XCTAssertEqual(viewModel.currentStep, .enteringPassword)
    }
}
