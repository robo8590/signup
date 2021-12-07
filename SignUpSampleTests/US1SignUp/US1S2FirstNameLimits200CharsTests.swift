//
//  US1S2FirstNameLimits200CharsTests.swift
//  SignUpSampleTests
//
//  Created by Nam Tran on 12/5/21.
//
//  US1 - User story 1 : Sign Up
//
//  As a guest user,
//  I want to create my account
//  so that I can login to the system.
//
//  Entering the first name
//
//  US1-S2 - Scenario 2: The first name limits 200 characters.
//  Given I started the sign up wizard
//  and I tapped to the first name text field
//  and the keyboard was presented
//  when I enter more than 200 characters
//  then the first name field only accepts 200 characters.
//

import XCTest
@testable import SignUpSample

class US1S2FirstNameLimits200CharsTests: XCTestCase {
    func testViewModel() {
        let viewModel = SignUpViewModel()

        // Given
        XCTAssertEqual(viewModel.currentStep, .enteringFirstName)

        // When
        let input = "Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran "
        + "Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran "
        + "Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran Nam Tran"
        viewModel.firstName = input
        viewModel.trimFirstNameIfNeeded()

        // Then
        XCTAssertEqual(viewModel.firstName, String(input.prefix(200)))
        XCTAssertEqual(viewModel.isCurrentInputValid, true)
    }
}
