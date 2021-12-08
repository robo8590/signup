//
//  US1S3EmailIsRequiredTests.swift
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
//  US1-S3 - Scenario 3: The email is required.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the email
//  and the email text field was focused on
//  and the keyboard was presented
//  then the next button are disabled.
//

import XCTest
@testable import SignUpSample

class US1S3EmailIsRequiredTests: XCTestCase {
    func testViewModel() {
        let viewModel = SignUpViewModel()

        // Given
        viewModel.firstName = "Nam Tran"
        viewModel.currentStep = .enteringEmail
        XCTAssertEqual(viewModel.email, "")
        XCTAssertFalse(viewModel.isCurrentInputValid)

        // When
        viewModel.next()

        // Then
        XCTAssertEqual(viewModel.currentStep, .enteringEmail)
    }
}
