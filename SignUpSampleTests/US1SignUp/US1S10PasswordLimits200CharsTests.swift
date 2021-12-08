//
//  US1S10PasswordLimits200CharactersTests.swift
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
//  US1-S10 - Scenario 10: The password limits 200 characters.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the password
//  and the password field was focused on
//  and the keyboard was presented
//  when I enter more than 200 characters
//  then the password field only accepts 200 characters.
//

import XCTest
@testable import SignUpSample

class US1S10PasswordLimits200CharsTests: XCTestCase {
    func testViewModel() {
        let viewModel = SignUpViewModel()

        // Given
        viewModel.firstName = "Nam"
        viewModel.email = "robo8590@gmail.com"
        viewModel.currentStep = .enteringPassword
        XCTAssertEqual(viewModel.password, "")
        XCTAssertFalse(viewModel.isCurrentInputValid)

        // When
        let input = "Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam"
        + "Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!NamNam!Nam!Na"
        + "Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!NamNam!Nam!Na"
        viewModel.password = input
        viewModel.handlePasswordOnChange()

        // Then
        XCTAssertTrue(viewModel.isCurrentInputValid)
        XCTAssertEqual(viewModel.password, String(input.prefix(200)))
    }
}
