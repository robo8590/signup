//
//  US1S1FirstNameIsOptinalTests.swift
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
//  Entering the first name
//
//  US1-S1 - Scenario 1: The first name is optional.
//
//  Given I started the sign up wizard
//  and I tapped to the first name text field
//  and the keyboard was presented
//  when I don't want to enter the first name
//  and I tap to the next button
//  then the email text field should be showed.
//

import XCTest
@testable import SignUpSample

class US1S1FirstNameIsOptinalTests: XCTestCase {
    func testViewModel() {
        let viewModel = SignUpViewModel()

        // Given
        XCTAssertEqual(viewModel.currentStep, .enteringFirstName)
        XCTAssertEqual(viewModel.firstName, "")
        XCTAssertEqual(viewModel.isCurrentInputValid, true)

        // When
        viewModel.next()

        // Then
        XCTAssertEqual(viewModel.currentStep, .enteringEmail)
        XCTAssertEqual(viewModel.isCurrentInputValid, false)
    }
}
