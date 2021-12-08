//
//  US1S7PasswordIsRequiredTests.swift
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
//  US1-S7 - Scenario 7: The password is required.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the password
//  and the password field was focused on
//  and the keyboard was presented
//  then the next button are disabled.
//

import XCTest
@testable import SignUpSample

class US1S7PasswordIsRequiredTests: XCTestCase {
    func testViewModel() {
        let viewModel = SignUpViewModel()

        // Given
        viewModel.firstName = "Nam Tran"
        viewModel.email = "robo8590@gmail.com"
        viewModel.currentStep = .enteringPassword
        XCTAssertEqual(viewModel.password, "")
        XCTAssertFalse(viewModel.isCurrentInputValid)

        // When
        viewModel.next()

        // Then
        XCTAssertEqual(viewModel.currentStep, .enteringPassword)
    }
}
